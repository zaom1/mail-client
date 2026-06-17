import 'dart:async';
import 'dart:isolate';
import 'package:logger/logger.dart';

/// Dart Isolate sandbox for running plugins safely.
class IsolateSandbox {
  final Logger _logger = Logger();
  Isolate? _isolate;
  SendPort? _sendPort;
  final Completer<void> _readyCompleter = Completer<void>();

  /// Initialize the sandbox.
  Future<void> initialize() async {
    final receivePort = ReceivePort();

    _isolate = await Isolate.spawn(
      _isolateEntryPoint,
      receivePort.sendPort,
    );

    _sendPort = await receivePort.first as SendPort;
    _readyCompleter.complete();
    _logger.i('Isolate sandbox initialized');
  }

  /// Send a message to the plugin and wait for response.
  Future<dynamic> send(Map<String, dynamic> message) async {
    await _readyCompleter.future;

    final responsePort = ReceivePort();
    _sendPort?.send({
      'message': message,
      'responsePort': responsePort.sendPort,
    });

    return await responsePort.first;
  }

  /// Dispose the sandbox.
  void dispose() {
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    _sendPort = null;
    _logger.i('Isolate sandbox disposed');
  }
}

void _isolateEntryPoint(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((data) {
    final message = data['message'] as Map<String, dynamic>;
    final responsePort = data['responsePort'] as SendPort;

    // Handle plugin messages
    // TODO: Route to plugin implementation
    responsePort.send({'status': 'ok', 'data': null});
  });
}

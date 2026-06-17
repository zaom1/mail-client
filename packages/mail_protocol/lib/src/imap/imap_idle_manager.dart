import 'dart:async';
import 'package:logger/logger.dart';
import 'imap_client.dart';

/// Manages IMAP IDLE for real-time push notifications.
class ImapIdleManager {
  final Logger _logger = Logger();
  final Map<String, _IdleSession> _sessions = {};
  Timer? _renewTimer;

  /// Start IDLE for a specific account and folder.
  Future<void> startListening({
    required String accountId,
    required String folderName,
    required ImapClientWrapper client,
    required void Function() onNewMessage,
    required void Function(String error) onError,
  }) async {
    final key = '$accountId:$folderName';

    // Stop existing session if any
    await stopListening(accountId, folderName);

    try {
      await client.selectMailbox(folderName);
      await client.startIdle(onNewMessage);

      _sessions[key] = _IdleSession(
        client: client,
        startedAt: DateTime.now(),
      );

      // Set up renewal timer (IDLE must be renewed every 29 minutes)
      _renewTimer?.cancel();
      _renewTimer = Timer.periodic(
        const Duration(minutes: 29),
        (_) => _renewIdleSessions(),
      );

      _logger.i('IDLE started for $key');
    } catch (e) {
      _logger.e('Failed to start IDLE for $key', error: e);
      onError(e.toString());
    }
  }

  /// Stop IDLE for a specific account and folder.
  Future<void> stopListening(String accountId, String folderName) async {
    final key = '$accountId:$folderName';
    final session = _sessions.remove(key);

    if (session != null) {
      try {
        await session.client.stopIdle();
        _logger.i('IDLE stopped for $key');
      } catch (e) {
        _logger.w('Error stopping IDLE for $key', error: e);
      }
    }
  }

  /// Renew all active IDLE sessions.
  Future<void> _renewIdleSessions() async {
    for (final entry in _sessions.entries) {
      try {
        await entry.value.client.stopIdle();
        await entry.value.client.startIdle(() {});
        entry.value.startedAt = DateTime.now();
        _logger.d('IDLE renewed for ${entry.key}');
      } catch (e) {
        _logger.w('Failed to renew IDLE for ${entry.key}', error: e);
      }
    }
  }

  /// Stop all IDLE sessions and clean up.
  Future<void> dispose() async {
    _renewTimer?.cancel();
    for (final key in _sessions.keys.toList()) {
      final parts = key.split(':');
      await stopListening(parts[0], parts[1]);
    }
  }
}

class _IdleSession {
  final ImapClientWrapper client;
  DateTime startedAt;

  _IdleSession({required this.client, required this.startedAt});
}

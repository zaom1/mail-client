import 'package:enough_mail/enough_mail.dart';
import 'package:logger/logger.dart';

/// POP3 client wrapper for email retrieval.
class Pop3ClientWrapper {
  final Logger _logger = Logger();
  Pop3Client? _client;
  bool _isConnected = false;

  bool get isConnected => _isConnected;

  /// Connect to a POP3 server.
  Future<void> connect({
    required String host,
    required int port,
    required String username,
    required String password,
    bool ssl = true,
  }) async {
    try {
      _client = Pop3Client(isLogEnabled: false);
      await _client!.connectToServer(host, port, isSecure: ssl);
      await _client!.login(username, password);
      _isConnected = true;
      _logger.i('POP3 connected to $host:$port');
    } catch (e) {
      _isConnected = false;
      _logger.e('POP3 connection failed', error: e);
      rethrow;
    }
  }

  /// Get message count on server.
  Future<int> getMessageCount() async {
    _ensureConnected();
    final status = await _client!.status();
    return status.numberOfMessages;
  }

  /// Get list of message UIDs (for tracking downloaded messages).
  Future<List<String>> listUids() async {
    _ensureConnected();
    final uids = await _client!.uidList();
    return uids;
  }

  /// Fetch a message by number (1-based).
  Future<MimeMessage> fetchMessage(int number) async {
    _ensureConnected();
    return await _client!.retrieve(number);
  }

  /// Delete a message by number.
  Future<void> deleteMessage(int number) async {
    _ensureConnected();
    await _client!.delete(number);
  }

  /// Commit deletions.
  Future<void> commit() async {
    _ensureConnected();
    // POP3 deletions are committed on QUIT
    await _client!.quit();
    _isConnected = false;
  }

  /// Disconnect from server.
  Future<void> disconnect() async {
    if (_client != null && _isConnected) {
      try {
        await _client!.quit();
      } catch (_) {}
      _isConnected = false;
    }
  }

  void _ensureConnected() {
    if (!_isConnected || _client == null) {
      throw StateError('POP3 client is not connected');
    }
  }
}

import 'package:enough_mail/enough_mail.dart';
import 'package:logger/logger.dart';

/// High-level SMTP client wrapper for sending emails.
class SmtpClientWrapper {
  final Logger _logger = Logger();
  SmtpClient? _client;

  /// Connect and authenticate to an SMTP server.
  Future<void> connect({
    required String host,
    required int port,
    required String username,
    required String password,
    bool ssl = false,
    bool startTls = true,
  }) async {
    try {
      _client = SmtpClient('mail-client', isLogEnabled: false);
      await _client!.connectToServer(host, port);

      if (startTls && !ssl) {
        await _client!.startTls();
      }

      await _client!.login(username, password);
      _logger.i('SMTP connected to $host:$port');
    } catch (e) {
      _logger.e('SMTP connection failed', error: e);
      rethrow;
    }
  }

  /// Send an email message.
  Future<SmtpSendResponse> sendMessage(MimeMessage message) async {
    if (_client == null) {
      throw StateError('SMTP client is not connected');
    }

    try {
      final response = await _client!.sendMessage(message);
      _logger.i('Message sent successfully');
      return response;
    } catch (e) {
      _logger.e('Failed to send message', error: e);
      rethrow;
    }
  }

  /// Disconnect from the SMTP server.
  Future<void> disconnect() async {
    if (_client != null) {
      try {
        await _client!.quit();
      } catch (_) {
        // Ignore errors during quit
      }
      _client = null;
    }
  }
}

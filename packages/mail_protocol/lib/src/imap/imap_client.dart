import 'package:enough_mail/enough_mail.dart';
import 'package:mail_core/mail_core.dart';
import 'package:logger/logger.dart';

/// High-level IMAP client wrapper around enough_mail.
class ImapClientWrapper {
  final Logger _logger = Logger();
  ImapClient? _client;
  bool _isConnected = false;

  /// Whether the client is currently connected.
  bool get isConnected => _isConnected;

  /// Connect to an IMAP server.
  Future<void> connect({
    required String host,
    required int port,
    required String username,
    required String password,
    bool ssl = true,
    bool startTls = false,
  }) async {
    try {
      _client = ImapClient(isLogEnabled: false);
      await _client!.connectToServer(
        host,
        port,
        isSecure: ssl,
        onBadCertificate: (cert) => true, // For development only
      );

      if (startTls && !ssl) {
        await _client!.startTls();
      }

      await _client!.login(username, password);
      _isConnected = true;
      _logger.i('IMAP connected to $host:$port');
    } catch (e) {
      _isConnected = false;
      _logger.e('IMAP connection failed', error: e);
      rethrow;
    }
  }

  /// Connect using OAuth2 XOAUTH2.
  Future<void> connectOAuth2({
    required String host,
    required int port,
    required String username,
    required String accessToken,
    bool ssl = true,
  }) async {
    try {
      _client = ImapClient(isLogEnabled: false);
      await _client!.connectToServer(host, port, isSecure: ssl);
      await _client!.authenticateWithOAuth2(username, accessToken);
      _isConnected = true;
      _logger.i('IMAP connected (OAuth2) to $host:$port');
    } catch (e) {
      _isConnected = false;
      _logger.e('IMAP OAuth2 connection failed', error: e);
      rethrow;
    }
  }

  /// List all folders/mailboxes.
  Future<List<Mailbox>> listMailboxes() async {
    _ensureConnected();
    final mailboxes = await _client!.listMailboxes(
      path: '',
      mailboxQuery: '*',
    );
    return mailboxes;
  }

  /// Select a mailbox.
  Future<Mailbox> selectMailbox(String mailboxName) async {
    _ensureConnected();
    return await _client!.selectMailboxByPath(mailboxName);
  }

  /// Fetch messages from a mailbox.
  Future<List<MimeMessage>> fetchMessages({
    int from = 1,
    int to = 50,
    List<String> headers = const ['Subject', 'From', 'To', 'Date'],
  }) async {
    _ensureConnected();
    final sequence = MessageSequence.fromRange(from, to);
    final messages = await _client!.fetchMessages(
      sequence,
      'BODY.PEEK[HEADER.FIELDS (${headers.join(' ')})]',
    );
    return messages.toList();
  }

  /// Fetch full message content by UID.
  Future<MimeMessage> fetchMessage(int uid) async {
    _ensureConnected();
    final sequence = MessageSequence.fromUid(uid);
    final messages = await _client!.fetchMessages(
      sequence,
      'BODY[]',
    );
    return messages.first;
  }

  /// Search messages.
  Future<List<int>> search(String criteria) async {
    _ensureConnected();
    final uids = await _client!.searchMessages(criteria);
    return uids.toList();
  }

  /// Mark message as seen.
  Future<void> markAsSeen(int uid) async {
    _ensureConnected();
    final sequence = MessageSequence.fromUid(uid);
    await _client!.store(
      sequence,
      [MessageFlag.flagSeen],
      action: StoreAction.add,
      isUid: true,
    );
  }

  /// Mark message as flagged.
  Future<void> markAsFlagged(int uid) async {
    _ensureConnected();
    final sequence = MessageSequence.fromUid(uid);
    await _client!.store(
      sequence,
      [MessageFlag.flagFlagged],
      action: StoreAction.add,
      isUid: true,
    );
  }

  /// Move message to another mailbox.
  Future<void> moveMessage(int uid, String targetMailbox) async {
    _ensureConnected();
    final sequence = MessageSequence.fromUid(uid);
    await _client!.move(sequence, targetMailbox, isUid: true);
  }

  /// Delete message (move to trash or expunge).
  Future<void> deleteMessage(int uid) async {
    _ensureConnected();
    final sequence = MessageSequence.fromUid(uid);
    await _client!.store(
      sequence,
      [MessageFlag.flagDeleted],
      action: StoreAction.add,
      isUid: true,
    );
    await _client!.expunge();
  }

  /// Start IDLE mode for real-time notifications.
  Future<void> startIdle(void Function() onNewMessage) async {
    _ensureConnected();
    _client!.startIdle(onNewMessage);
  }

  /// Stop IDLE mode.
  Future<void> stopIdle() async {
    _ensureConnected();
    await _client!.stopIdle();
  }

  /// Send NOOP to keep connection alive.
  Future<void> noop() async {
    _ensureConnected();
    await _client!.noop();
  }

  /// Disconnect from server.
  Future<void> disconnect() async {
    if (_client != null && _isConnected) {
      try {
        await _client!.logout();
      } catch (_) {
        // Ignore errors during logout
      }
      _isConnected = false;
      _logger.i('IMAP disconnected');
    }
  }

  void _ensureConnected() {
    if (!_isConnected || _client == null) {
      throw StateError('IMAP client is not connected');
    }
  }
}

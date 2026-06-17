import 'package:logger/logger.dart';
import 'imap_client.dart';

/// Connection pool for managing multiple IMAP connections per account.
class ImapConnectionPool {
  final Logger _logger = Logger();
  final Map<String, _ConnectionEntry> _connections = {};
  static const _maxIdleMinutes = 25; // IMAP IDLE max is 30 min

  /// Get or create a connection for an account.
  Future<ImapClientWrapper> getConnection(String accountId) async {
    final entry = _connections[accountId];
    if (entry != null && entry.client.isConnected) {
      entry.lastUsed = DateTime.now();
      return entry.client;
    }
    throw StateError('No active connection for account: $accountId');
  }

  /// Add a new connection to the pool.
  void addConnection(String accountId, ImapClientWrapper client) {
    _connections[accountId] = _ConnectionEntry(
      client: client,
      lastUsed: DateTime.now(),
    );
    _logger.i('Connection added to pool for account: $accountId');
  }

  /// Remove and disconnect a connection.
  Future<void> removeConnection(String accountId) async {
    final entry = _connections.remove(accountId);
    if (entry != null) {
      await entry.client.disconnect();
      _logger.i('Connection removed from pool for account: $accountId');
    }
  }

  /// Send NOOP to all connections to keep them alive.
  Future<void> keepAlive() async {
    for (final entry in _connections.values) {
      if (entry.client.isConnected) {
        try {
          await entry.client.noop();
        } catch (e) {
          _logger.w('Keep-alive failed for connection', error: e);
        }
      }
    }
  }

  /// Disconnect all connections.
  Future<void> disconnectAll() async {
    for (final entry in _connections.values) {
      await entry.client.disconnect();
    }
    _connections.clear();
    _logger.i('All connections disconnected');
  }

  /// Check if a connection exists for an account.
  bool hasConnection(String accountId) {
    final entry = _connections[accountId];
    return entry != null && entry.client.isConnected;
  }
}

class _ConnectionEntry {
  final ImapClientWrapper client;
  DateTime lastUsed;

  _ConnectionEntry({required this.client, required this.lastUsed});
}

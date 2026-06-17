import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage for credentials (passwords, OAuth2 tokens, etc.).
class CredentialsStore {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _keyPrefix = 'mail_credentials_';

  /// Save password for an account.
  Future<void> savePassword(String accountId, String password) async {
    await _storage.write(key: '$_keyPrefix${accountId}_password', value: password);
  }

  /// Get password for an account.
  Future<String?> getPassword(String accountId) async {
    return _storage.read(key: '$_keyPrefix${accountId}_password');
  }

  /// Save OAuth2 refresh token.
  Future<void> saveRefreshToken(String accountId, String token) async {
    await _storage.write(key: '$_keyPrefix${accountId}_refresh_token', value: token);
  }

  /// Get OAuth2 refresh token.
  Future<String?> getRefreshToken(String accountId) async {
    return _storage.read(key: '$_keyPrefix${accountId}_refresh_token');
  }

  /// Save OAuth2 access token with expiration.
  Future<void> saveAccessToken(String accountId, String token, DateTime expiresAt) async {
    await _storage.write(
      key: '$_keyPrefix${accountId}_access_token',
      value: '$token|${expiresAt.millisecondsSinceEpoch}',
    );
  }

  /// Get OAuth2 access token if not expired.
  Future<String?> getAccessToken(String accountId) async {
    final value = await _storage.read(key: '$_keyPrefix${accountId}_access_token');
    if (value == null) return null;

    final parts = value.split('|');
    if (parts.length != 2) return null;

    final expiresAt = DateTime.fromMillisecondsSinceEpoch(int.parse(parts[1]));
    if (DateTime.now().isAfter(expiresAt.subtract(const Duration(minutes: 5)))) {
      return null; // Token expired or about to expire
    }

    return parts[0];
  }

  /// Delete all credentials for an account.
  Future<void> deleteCredentials(String accountId) async {
    await _storage.delete(key: '$_keyPrefix${accountId}_password');
    await _storage.delete(key: '$_keyPrefix${accountId}_refresh_token');
    await _storage.delete(key: '$_keyPrefix${accountId}_access_token');
  }

  /// Clear all stored credentials.
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

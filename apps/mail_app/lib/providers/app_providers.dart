import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail_core/mail_core.dart';
import 'package:mail_storage/mail_storage.dart';

// ==================== Account Providers ====================

/// Provider for all email accounts.
final accountsProvider = StreamProvider<List<Account>>((ref) {
  // TODO: Get from database via DI
  return const Stream.empty();
});

/// Provider for the currently selected account.
final selectedAccountProvider = StateProvider<Account?>((ref) => null);

/// Provider for account status (connection, sync state).
final accountStatusProvider =
    StateProvider.family<AccountStatus, String>((ref, accountId) {
  return AccountStatus(accountId: accountId);
});

// ==================== Folder Providers ====================

/// Provider for folders of the current account.
final foldersProvider =
    StateProvider.family<List<Folder>, String>((ref, accountId) {
  return [];
});

/// Provider for the currently selected folder.
final selectedFolderProvider = StateProvider<String>((ref) => 'INBOX');

// ==================== Message Providers ====================

/// Provider for messages in the current folder.
final messagesProvider = StateProvider<List<Message>>((ref) => []);

/// Provider for the currently selected message.
final selectedMessageProvider = StateProvider<Message?>((ref) => null);

/// Provider for loading state.
final isLoadingProvider = StateProvider<bool>((ref) => false);

// ==================== Search Providers ====================

/// Provider for search query.
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Provider for search results.
final searchResultsProvider = StateProvider<List<Message>>((ref) => []);

// ==================== Compose Providers ====================

/// Provider for compose state (draft being edited).
final composeDraftProvider = StateProvider<Message?>((ref) => null);

// ==================== Settings Providers ====================

/// Provider for app theme mode.
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Provider for sync interval.
final syncIntervalProvider = StateProvider<int>((ref) => 15);

/// Provider for notification settings.
final notificationsEnabledProvider = StateProvider<bool>((ref) => true);

// ==================== Plugin Providers ====================

/// Provider for installed plugins.
final installedPluginsProvider = StateProvider<List<String>>((ref) => []);

/// Provider for active plugins.
final activePluginsProvider = StateProvider<List<String>>((ref) => []);

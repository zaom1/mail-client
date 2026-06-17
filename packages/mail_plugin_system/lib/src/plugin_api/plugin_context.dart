/// Context provided to plugins for interacting with the host application.
class PluginContext {
  final String pluginId;
  final PluginApi api;
  final PluginStorage storage;

  PluginContext({
    required this.pluginId,
    required this.api,
    required this.storage,
  });
}

/// API methods available to plugins.
abstract class PluginApi {
  // Mail operations
  Future<Map<String, dynamic>?> getMail(String mailId);
  Future<List<Map<String, dynamic>>> listMails(String folderId, {int page = 0, int limit = 50});
  Future<void> moveToFolder(String mailId, String folderId);
  Future<void> markRead(String mailId, bool read);
  Future<void> addLabel(String mailId, String label);
  Future<void> sendMail(Map<String, dynamic> draft);

  // UI operations
  void showToast(String message);
  Future<void> showDialog(Map<String, dynamic> config);
  void registerToolbarButton(Map<String, dynamic> config);

  // HTTP proxy (respects permissions)
  Future<Map<String, dynamic>> httpRequest(Map<String, dynamic> config);
}

/// Storage API for plugins.
abstract class PluginStorage {
  Future<dynamic> get(String key);
  Future<void> set(String key, dynamic value);
  Future<void> delete(String key);
  Future<void> clear();
}

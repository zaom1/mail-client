/// Hook points where plugins can inject custom behavior.
abstract class PluginHooks {
  /// Called when a new mail is received.
  Future<void> onMailReceived(Map<String, dynamic> mail) async {}

  /// Called when a mail is sent.
  Future<void> onMailSent(Map<String, dynamic> mail) async {}

  /// Called before a mail is sent (can modify or cancel).
  Future<bool> onBeforeSend(Map<String, dynamic> mail) async => true;

  /// Called when a mail is opened for reading.
  Future<void> onMailOpened(Map<String, dynamic> mail) async {}

  /// Called to extend the compose toolbar.
  List<Map<String, dynamic>> onComposeToolbar() => [];

  /// Called to extend the sidebar.
  List<Map<String, dynamic>> onSidebarExtension() => [];

  /// Called to extend the context menu.
  List<Map<String, dynamic>> onContextMenu(Map<String, dynamic> mail) => [];

  /// Called to extend mail list actions.
  List<Map<String, dynamic>> onMailListAction(List<String> mailIds) => [];

  /// Called to provide additional search results.
  Future<List<Map<String, dynamic>>> onSearchProvider(String query) async => [];

  /// Called to extend the settings panel.
  List<Map<String, dynamic>> onSettingsPanel() => [];

  /// Called to extend the top toolbar.
  List<Map<String, dynamic>> onToolbarExtension() => [];

  /// Called before rendering a mail (can modify HTML).
  Future<String> onMailRender(String html) async => html;
}

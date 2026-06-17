import 'package:mail_core/mail_core.dart';

/// Base interface that all plugins must implement.
abstract class MailPlugin {
  /// Plugin metadata.
  PluginMetadata get metadata;

  /// Called when the plugin is activated.
  Future<void> onActivate(PluginContext context);

  /// Called when the plugin is deactivated.
  Future<void> onDeactivate();

  /// Called when plugin settings change.
  Future<void> onSettingsChanged(Map<String, dynamic> settings);
}

/// Plugin metadata.
class PluginMetadata {
  final String id;
  final String name;
  final String version;
  final String author;
  final String description;
  final String? homepage;
  final List<PluginPermission> permissions;
  final List<String> hooks;

  const PluginMetadata({
    required this.id,
    required this.name,
    required this.version,
    required this.author,
    required this.description,
    this.homepage,
    this.permissions = const [],
    this.hooks = const [],
  });
}

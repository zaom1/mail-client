import 'package:logger/logger.dart';
import '../plugin_api/plugin_interface.dart';
import 'isolate_sandbox.dart';

/// Registry for managing installed and active plugins.
class PluginRegistry {
  final Logger _logger = Logger();
  final Map<String, _PluginEntry> _plugins = {};

  /// Register a plugin.
  void register(String id, MailPlugin plugin, IsolateSandbox sandbox) {
    _plugins[id] = _PluginEntry(
      plugin: plugin,
      sandbox: sandbox,
      isActive: false,
    );
    _logger.i('Plugin registered: ${plugin.metadata.name}');
  }

  /// Unregister a plugin.
  Future<void> unregister(String id) async {
    final entry = _plugins.remove(id);
    if (entry != null) {
      if (entry.isActive) {
        await entry.plugin.onDeactivate();
      }
      entry.sandbox.dispose();
      _logger.i('Plugin unregistered: $id');
    }
  }

  /// Activate a plugin.
  Future<void> activate(String id) async {
    final entry = _plugins[id];
    if (entry == null) throw StateError('Plugin not found: $id');
    if (entry.isActive) return;

    // TODO: Create proper PluginContext
    // await entry.plugin.onActivate(context);
    entry.isActive = true;
    _logger.i('Plugin activated: $id');
  }

  /// Deactivate a plugin.
  Future<void> deactivate(String id) async {
    final entry = _plugins[id];
    if (entry == null) return;
    if (!entry.isActive) return;

    await entry.plugin.onDeactivate();
    entry.isActive = false;
    _logger.i('Plugin deactivated: $id');
  }

  /// Get all registered plugins.
  List<MailPlugin> getAllPlugins() {
    return _plugins.values.map((e) => e.plugin).toList();
  }

  /// Get active plugins.
  List<MailPlugin> getActivePlugins() {
    return _plugins.values
        .where((e) => e.isActive)
        .map((e) => e.plugin)
        .toList();
  }

  /// Check if a plugin is registered.
  bool isRegistered(String id) => _plugins.containsKey(id);

  /// Check if a plugin is active.
  bool isActive(String id) => _plugins[id]?.isActive ?? false;

  /// Dispose all plugins.
  Future<void> dispose() async {
    for (final entry in _plugins.values) {
      if (entry.isActive) {
        await entry.plugin.onDeactivate();
      }
      entry.sandbox.dispose();
    }
    _plugins.clear();
  }
}

class _PluginEntry {
  final MailPlugin plugin;
  final IsolateSandbox sandbox;
  bool isActive;

  _PluginEntry({
    required this.plugin,
    required this.sandbox,
    required this.isActive,
  });
}

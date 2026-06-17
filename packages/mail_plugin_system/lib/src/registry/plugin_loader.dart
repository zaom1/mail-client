import 'dart:io';
import 'package:logger/logger.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as p;

/// Loader for discovering and loading plugins from the filesystem.
class PluginLoader {
  final Logger _logger = Logger();
  final String pluginsDirectory;

  PluginLoader({required this.pluginsDirectory});

  /// Discover all installed plugins.
  Future<List<PluginManifest>> discoverPlugins() async {
    final dir = Directory(pluginsDirectory);
    if (!await dir.exists()) {
      _logger.i('Plugins directory does not exist: $pluginsDirectory');
      return [];
    }

    final manifests = <PluginManifest>[];

    await for (final entity in dir.list()) {
      if (entity is Directory) {
        final manifestFile = File(p.join(entity.path, 'manifest.yaml'));
        if (await manifestFile.exists()) {
          try {
            final content = await manifestFile.readAsString();
            final yaml = loadYaml(content) as YamlMap;
            manifests.add(PluginManifest.fromYaml(yaml, entity.path));
          } catch (e) {
            _logger.w('Failed to load plugin manifest from ${entity.path}', error: e);
          }
        }
      }
    }

    _logger.i('Discovered ${manifests.length} plugins');
    return manifests;
  }

  /// Load a specific plugin by path.
  Future<PluginManifest?> loadPlugin(String path) async {
    final manifestFile = File(p.join(path, 'manifest.yaml'));
    if (!await manifestFile.exists()) return null;

    try {
      final content = await manifestFile.readAsString();
      final yaml = loadYaml(content) as YamlMap;
      return PluginManifest.fromYaml(yaml, path);
    } catch (e) {
      _logger.w('Failed to load plugin from $path', error: e);
      return null;
    }
  }
}

/// Parsed plugin manifest.
class PluginManifest {
  final String id;
  final String name;
  final String version;
  final String author;
  final String description;
  final String path;
  final List<String> permissions;
  final String entryPoint;

  PluginManifest({
    required this.id,
    required this.name,
    required this.version,
    required this.author,
    required this.description,
    required this.path,
    required this.permissions,
    required this.entryPoint,
  });

  factory PluginManifest.fromYaml(YamlMap yaml, String path) {
    return PluginManifest(
      id: yaml['id'] as String? ?? yaml['name'] as String,
      name: yaml['name'] as String,
      version: yaml['version'] as String? ?? '0.1.0',
      author: yaml['author'] as String? ?? 'Unknown',
      description: yaml['description'] as String? ?? '',
      path: path,
      permissions: (yaml['permissions'] as YamlList?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      entryPoint: yaml['entry_point'] as String? ?? 'lib/main.dart',
    );
  }
}

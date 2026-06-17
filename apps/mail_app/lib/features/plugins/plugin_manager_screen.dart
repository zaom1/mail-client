import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Plugin manager screen for installing, enabling, and managing plugins.
class PluginManagerScreen extends ConsumerStatefulWidget {
  const PluginManagerScreen({super.key});

  @override
  ConsumerState<PluginManagerScreen> createState() =>
      _PluginManagerScreenState();
}

class _PluginManagerScreenState extends ConsumerState<PluginManagerScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugins'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Installed'),
            Tab(text: 'Available'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Installed plugins
          _InstalledPluginsTab(),
          // Available plugins (store)
          _AvailablePluginsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showInstallFromUrl(context),
        icon: const Icon(Icons.add),
        label: const Text('Install'),
      ),
    );
  }

  void _showInstallFromUrl(BuildContext context) {
    final urlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Install Plugin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Enter the plugin package URL or path to install.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'Plugin URL',
                hintText: 'https://plugins.example.com/my-plugin',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement plugin installation
            },
            child: const Text('Install'),
          ),
        ],
      ),
    );
  }
}

class _InstalledPluginsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // TODO: Load from plugin registry
    final plugins = [
      _PluginInfo(
        name: 'Email Translator',
        description: 'Translate emails to your preferred language',
        version: '1.2.0',
        author: 'Community',
        isEnabled: true,
        icon: Icons.translate,
      ),
      _PluginInfo(
        name: 'Smart Signature',
        description: 'Professional email signatures with templates',
        version: '1.0.3',
        author: 'Community',
        isEnabled: true,
        icon: Icons.edit_document,
      ),
      _PluginInfo(
        name: 'Mail Templates',
        description: 'Pre-built email templates for common scenarios',
        version: '2.0.1',
        author: 'Community',
        isEnabled: false,
        icon: Icons.description_outlined,
      ),
    ];

    if (plugins.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.extension_outlined,
              size: 64,
              color: theme.colorScheme.surfaceContainerHighest,
            ),
            const SizedBox(height: 16),
            Text(
              'No plugins installed',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Browse available plugins to extend your mail client',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plugins.length,
      itemBuilder: (context, index) {
        final plugin = plugins[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(
                plugin.icon,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            title: Text(plugin.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plugin.description),
                Text(
                  'v${plugin.version} · ${plugin.author}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            isThreeLine: true,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: plugin.isEnabled,
                  onChanged: (value) {},
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'settings',
                      child: Text('Settings'),
                    ),
                    const PopupMenuItem(
                      value: 'uninstall',
                      child: Text('Uninstall'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AvailablePluginsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final plugins = [
      _PluginInfo(
        name: 'AI Summary',
        description: 'Get AI-powered summaries of long emails',
        version: '1.0.0',
        author: 'Community',
        isEnabled: false,
        icon: Icons.auto_awesome,
      ),
      _PluginInfo(
        name: 'PGP Encryption',
        description: 'End-to-end email encryption with PGP',
        version: '1.1.0',
        author: 'Security Team',
        isEnabled: false,
        icon: Icons.lock,
      ),
      _PluginInfo(
        name: 'Calendar Integration',
        description: 'Extract events from emails and add to calendar',
        version: '1.0.0',
        author: 'Community',
        isEnabled: false,
        icon: Icons.event,
      ),
      _PluginInfo(
        name: 'Read Receipt',
        description: 'Request and track email read receipts',
        version: '1.0.0',
        author: 'Community',
        isEnabled: false,
        icon: Icons.mark_email_read,
      ),
      _PluginInfo(
        name: 'Ad Blocker',
        description: 'Block tracking pixels and ads in emails',
        version: '2.0.0',
        author: 'Privacy Team',
        isEnabled: false,
        icon: Icons.block,
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plugins.length,
      itemBuilder: (context, index) {
        final plugin = plugins[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.secondaryContainer,
              child: Icon(
                plugin.icon,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
            title: Text(plugin.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plugin.description),
                Text(
                  'v${plugin.version} · ${plugin.author}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            isThreeLine: true,
            trailing: FilledButton.tonal(
              onPressed: () {},
              child: const Text('Install'),
            ),
          ),
        );
      },
    );
  }
}

class _PluginInfo {
  const _PluginInfo({
    required this.name,
    required this.description,
    required this.version,
    required this.author,
    required this.isEnabled,
    required this.icon,
  });

  final String name;
  final String description;
  final String version;
  final String author;
  final bool isEnabled;
  final IconData icon;
}

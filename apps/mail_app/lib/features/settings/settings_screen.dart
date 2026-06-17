import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Settings screen with account management and app preferences.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Accounts section
          _SectionHeader(title: 'Accounts'),
          ListTile(
            leading: const CircleAvatar(child: Text('A')),
            title: const Text('user@example.com'),
            subtitle: const Text('IMAP · Google'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/account/default'),
          ),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.grey),
            title: const Text('Add Account'),
            onTap: () => context.go('/account-setup'),
          ),

          const Divider(),

          // General section
          _SectionHeader(title: 'General'),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Follow system theme'),
            value: true,
            onChanged: (value) {},
            secondary: const Icon(Icons.dark_mode_outlined),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'English',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, size: 20),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            subtitle: const Text('New mail alerts'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          const Divider(),

          // Mail section
          _SectionHeader(title: 'Mail'),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('Sync Frequency'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Every 15 min',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, size: 20),
              ],
            ),
            onTap: () {},
          ),
          SwitchListTile(
            title: const Text('Show Images'),
            subtitle: const Text('Always display external images'),
            value: false,
            onChanged: (value) {},
            secondary: const Icon(Icons.image_outlined),
          ),
          SwitchListTile(
            title: const Text('Conversation View'),
            subtitle: const Text('Group related messages'),
            value: true,
            onChanged: (value) {},
            secondary: const Icon(Icons.forum_outlined),
          ),
          ListTile(
            leading: const Icon(Icons.edit_document),
            title: const Text('Signature'),
            subtitle: const Text('Not set'),
            onTap: () {},
          ),

          const Divider(),

          // Plugins section
          _SectionHeader(title: 'Extensions'),
          ListTile(
            leading: const Icon(Icons.extension_outlined),
            title: const Text('Plugins'),
            subtitle: const Text('Manage installed plugins'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/plugins'),
          ),

          const Divider(),

          // About section
          _SectionHeader(title: 'About'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version'),
            subtitle: const Text('0.1.0'),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Open Source Licenses'),
            onTap: () {},
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

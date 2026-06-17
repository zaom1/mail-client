import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Account-specific settings screen.
class AccountSettingsScreen extends ConsumerWidget {
  const AccountSettingsScreen({super.key, required this.accountId});

  final String accountId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 16),

          // Account info card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          child: Text('A'),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'user@example.com',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'IMAP · Google Workspace',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Sync settings
          _SectionHeader(title: 'Sync'),
          ListTile(
            title: const Text('Sync Frequency'),
            subtitle: const Text('Every 15 minutes'),
            leading: const Icon(Icons.sync),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Days to Sync'),
            subtitle: const Text('Last 30 days'),
            leading: const Icon(Icons.calendar_today),
            onTap: () {},
          ),
          SwitchListTile(
            title: const Text('Sync Contacts'),
            value: true,
            onChanged: (value) {},
            secondary: const Icon(Icons.contacts_outlined),
          ),
          SwitchListTile(
            title: const Text('Sync Calendar'),
            value: false,
            onChanged: (value) {},
            secondary: const Icon(Icons.calendar_month_outlined),
          ),

          const Divider(),

          // Server settings
          _SectionHeader(title: 'Server Settings'),
          ListTile(
            title: const Text('IMAP Server'),
            subtitle: const Text('imap.gmail.com:993 (SSL/TLS)'),
            leading: const Icon(Icons.dns_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const Text('SMTP Server'),
            subtitle: const Text('smtp.gmail.com:587 (STARTTLS)'),
            leading: const Icon(Icons.send_outlined),
            onTap: () {},
          ),

          const Divider(),

          // Signature
          _SectionHeader(title: 'Signature'),
          ListTile(
            title: const Text('Email Signature'),
            subtitle: const Text('Not set'),
            leading: const Icon(Icons.edit_outlined),
            onTap: () {},
          ),

          const Divider(),

          // Danger zone
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('Remove Account'),
            ),
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

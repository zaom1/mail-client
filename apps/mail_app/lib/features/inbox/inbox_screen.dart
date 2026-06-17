import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mail_ui_kit/mail_ui_kit.dart';

/// Main inbox screen with responsive three-column layout.
/// Columns: Folder tree | Message list | Message preview/reader
class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen> {
  String _selectedFolder = 'INBOX';
  String? _selectedMessageId;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layoutType = LayoutResolver.resolve(context);

    return AdaptiveMailScaffold(
      layoutType: layoutType,
      sidebar: _FolderSidebar(
        selectedFolder: _selectedFolder,
        onFolderSelected: (folder) {
          setState(() {
            _selectedFolder = folder;
            _selectedMessageId = null;
          });
        },
      ),
      messageList: _MessageListPanel(
        folder: _selectedFolder,
        searchController: _searchController,
        selectedMessageId: _selectedMessageId,
        onMessageSelected: (id) {
          setState(() => _selectedMessageId = id);
          // On compact layout, navigate to detail
          if (layoutType == LayoutType.compact) {
            context.go('/inbox/message/$id');
          }
        },
        onCompose: () => context.go('/inbox/compose'),
        onSearch: () => context.go('/inbox/search'),
      ),
      messagePreview: _selectedMessageId != null
          ? _MessagePreviewPanel(messageId: _selectedMessageId!)
          : const _EmptyPreview(),
    );
  }
}

// ==================== Folder Sidebar ====================

class _FolderSidebar extends StatelessWidget {
  const _FolderSidebar({
    required this.selectedFolder,
    required this.onFolderSelected,
  });

  final String selectedFolder;
  final ValueChanged<String> onFolderSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      color: colorScheme.surfaceContainerLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Account header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Account',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'user@example.com',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined, size: 20),
                  onPressed: () => context.go('/settings'),
                  tooltip: 'Settings',
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Folder list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _FolderTile(
                  icon: Icons.inbox_outlined,
                  label: 'Inbox',
                  folder: 'INBOX',
                  unreadCount: 12,
                  isSelected: selectedFolder == 'INBOX',
                  onTap: () => onFolderSelected('INBOX'),
                ),
                _FolderTile(
                  icon: Icons.star_outline,
                  label: 'Starred',
                  folder: 'STARRED',
                  isSelected: selectedFolder == 'STARRED',
                  onTap: () => onFolderSelected('STARRED'),
                ),
                _FolderTile(
                  icon: Icons.send_outlined,
                  label: 'Sent',
                  folder: 'SENT',
                  isSelected: selectedFolder == 'SENT',
                  onTap: () => onFolderSelected('SENT'),
                ),
                _FolderTile(
                  icon: Icons.drafts_outlined,
                  label: 'Drafts',
                  folder: 'DRAFTS',
                  unreadCount: 2,
                  isSelected: selectedFolder == 'DRAFTS',
                  onTap: () => onFolderSelected('DRAFTS'),
                ),
                _FolderTile(
                  icon: Icons.report_outlined,
                  label: 'Spam',
                  folder: 'JUNK',
                  isSelected: selectedFolder == 'JUNK',
                  onTap: () => onFolderSelected('JUNK'),
                ),
                _FolderTile(
                  icon: Icons.delete_outline,
                  label: 'Trash',
                  folder: 'TRASH',
                  isSelected: selectedFolder == 'TRASH',
                  onTap: () => onFolderSelected('TRASH'),
                ),
                _FolderTile(
                  icon: Icons.archive_outlined,
                  label: 'Archive',
                  folder: 'ARCHIVE',
                  isSelected: selectedFolder == 'ARCHIVE',
                  onTap: () => onFolderSelected('ARCHIVE'),
                ),
                const Divider(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'FOLDERS',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Custom folders would be loaded dynamically
                _FolderTile(
                  icon: Icons.folder_outlined,
                  label: 'Work',
                  folder: 'Work',
                  isSelected: selectedFolder == 'Work',
                  onTap: () => onFolderSelected('Work'),
                ),
                _FolderTile(
                  icon: Icons.folder_outlined,
                  label: 'Personal',
                  folder: 'Personal',
                  isSelected: selectedFolder == 'Personal',
                  onTap: () => onFolderSelected('Personal'),
                ),
              ],
            ),
          ),

          // Storage indicator
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2.4 GB / 15 GB used',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: 0.16,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FolderTile extends StatelessWidget {
  const _FolderTile({
    required this.icon,
    required this.label,
    required this.folder,
    required this.isSelected,
    required this.onTap,
    this.unreadCount = 0,
  });

  final IconData icon;
  final String label;
  final String folder;
  final bool isSelected;
  final VoidCallback onTap;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      child: Material(
        color: isSelected
            ? colorScheme.secondaryContainer
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected
                      ? colorScheme.onSecondaryContainer
                      : colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight:
                          isSelected || unreadCount > 0
                              ? FontWeight.w600
                              : FontWeight.normal,
                      color: isSelected
                          ? colorScheme.onSecondaryContainer
                          : null,
                    ),
                  ),
                ),
                if (unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colorScheme.onSecondaryContainer
                          : colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$unreadCount',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isSelected
                            ? colorScheme.secondaryContainer
                            : colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== Message List Panel ====================

class _MessageListPanel extends StatelessWidget {
  const _MessageListPanel({
    required this.folder,
    required this.searchController,
    required this.selectedMessageId,
    required this.onMessageSelected,
    required this.onCompose,
    required this.onSearch,
  });

  final String folder;
  final TextEditingController searchController;
  final String? selectedMessageId;
  final ValueChanged<String> onMessageSelected;
  final VoidCallback onCompose;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Header with search and compose
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onSearch,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 20,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Search mail...',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: onCompose,
                icon: const Icon(Icons.edit),
                tooltip: 'Compose',
              ),
            ],
          ),
        ),

        // Folder title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Text(
                folder == 'INBOX' ? 'Inbox' : folder,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '12 messages',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // Message list
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 20, // TODO: Replace with actual message count
            itemBuilder: (context, index) {
              final messageId = 'msg_$index';
              return MailTile(
                senderName: _getSenderName(index),
                senderEmail: _getSenderEmail(index),
                subject: _getSubject(index),
                preview: _getPreview(index),
                date: _getDate(index),
                isRead: index > 2,
                isFlagged: index == 0,
                hasAttachments: index % 3 == 0,
                isSelected: selectedMessageId == messageId,
                onTap: () => onMessageSelected(messageId),
              );
            },
          ),
        ),
      ],
    );
  }

  String _getSenderName(int index) {
    const names = [
      'Alice Johnson',
      'Bob Smith',
      'GitHub',
      'Google Cloud',
      'Newsletter',
      'David Chen',
      'Jira',
      'Marketing Team',
      'Support',
      'Emma Wilson',
    ];
    return names[index % names.length];
  }

  String _getSenderEmail(int index) {
    const emails = [
      'alice@example.com',
      'bob@company.com',
      'noreply@github.com',
      'noreply@google.com',
      'newsletter@tech.io',
      'david@example.com',
      'jira@atlassian.com',
      'marketing@brand.com',
      'support@service.com',
      'emma@example.com',
    ];
    return emails[index % emails.length];
  }

  String _getSubject(int index) {
    const subjects = [
      'Project Update: Q4 Planning',
      'Re: Meeting tomorrow',
      '[GitHub] Your pull request has been merged',
      'Your monthly billing statement',
      'This Week in Tech - Issue #245',
      'Lunch plans?',
      '[JIRA] PROJ-1234: New feature request',
      'Exclusive offer just for you!',
      'Your support ticket #5678',
      'Weekend plans',
    ];
    return subjects[index % subjects.length];
  }

  String _getPreview(int index) {
    const previews = [
      'Hi team, here is the update on our Q4 planning. We have made significant progress...',
      'Sounds good! Let me check my calendar and get back to you...',
      'Your pull request #1234 has been successfully merged into the main branch...',
      'Please find attached your monthly billing statement for October...',
      'Top stories this week: AI advances, new frameworks, and more...',
      'Hey! Want to grab lunch at that new place downtown?',
      'A new feature request has been created and assigned to your team...',
      'Don\'t miss out on our exclusive limited-time offer...',
      'Thank you for contacting support. We have received your ticket...',
      'Hey, any plans for the weekend? Thinking of going hiking...',
    ];
    return previews[index % previews.length];
  }

  DateTime _getDate(int index) {
    return DateTime.now().subtract(Duration(hours: index * 3));
  }
}

// ==================== Message Preview Panel ====================

class _MessagePreviewPanel extends StatelessWidget {
  const _MessagePreviewPanel({required this.messageId});

  final String messageId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // TODO: Load actual message content from database
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subject
          Text(
            'Project Update: Q4 Planning',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Sender info
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                child: Text('A'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alice Johnson',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'alice@example.com',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '2 hours ago',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.reply),
                onPressed: () {},
                tooltip: 'Reply',
              ),
              IconButton(
                icon: const Icon(Icons.forward),
                onPressed: () {},
                tooltip: 'Forward',
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
                tooltip: 'More',
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // Message body (placeholder)
          Text(
            'Hi team,\n\n'
            'Here is the update on our Q4 planning. We have made significant '
            'progress on the following items:\n\n'
            '1. Product roadmap has been finalized\n'
            '2. Resource allocation is complete\n'
            '3. Key milestones have been identified\n\n'
            'Please review the attached document and let me know if you have '
            'any questions or concerns.\n\n'
            'Best regards,\n'
            'Alice Johnson',
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
          ),

          const SizedBox(height: 24),

          // Attachments
          if (true) // TODO: Check if message has attachments
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                AttachmentChip(
                  filename: 'Q4_Plan.pdf',
                  size: '2.4 MB',
                  onTap: () {},
                ),
                AttachmentChip(
                  filename: 'budget.xlsx',
                  size: '856 KB',
                  onTap: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}

// ==================== Empty Preview ====================

class _EmptyPreview extends StatelessWidget {
  const _EmptyPreview();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.mail_outline_rounded,
            size: 80,
            color: theme.colorScheme.surfaceContainerHighest,
          ),
          const SizedBox(height: 16),
          Text(
            'Select a message to read',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Full-screen mail reader with HTML rendering support.
class MailReaderScreen extends ConsumerStatefulWidget {
  const MailReaderScreen({super.key, required this.messageId});

  final String messageId;

  @override
  ConsumerState<MailReaderScreen> createState() => _MailReaderScreenState();
}

class _MailReaderScreenState extends ConsumerState<MailReaderScreen> {
  bool _showImages = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
        actions: [
          IconButton(
            icon: const Icon(Icons.reply),
            onPressed: () {},
            tooltip: 'Reply',
          ),
          IconButton(
            icon: const Icon(Icons.reply_all),
            onPressed: () {},
            tooltip: 'Reply All',
          ),
          IconButton(
            icon: const Icon(Icons.forward),
            onPressed: () {},
            tooltip: 'Forward',
          ),
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'mark_unread', child: Text('Mark as unread')),
              const PopupMenuItem(value: 'move', child: Text('Move to...')),
              const PopupMenuItem(value: 'label', child: Text('Add label...')),
              const PopupMenuItem(value: 'archive', child: Text('Archive')),
              const PopupMenuItem(value: 'delete', child: Text('Delete')),
              const PopupMenuItem(value: 'print', child: Text('Print')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
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
            const SizedBox(height: 8),

            // Labels/tags
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: const Text('Important'),
                  backgroundColor: theme.colorScheme.errorContainer,
                  visualDensity: VisualDensity.compact,
                ),
                Chip(
                  label: const Text('Work'),
                  backgroundColor: theme.colorScheme.tertiaryContainer,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Sender and recipients
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFF4285F4),
                  child: Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Alice Johnson',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '<alice@example.com>',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'to me, bob@company.com',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Today, 10:32 AM',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // External images warning
            if (!_showImages)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 20,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Images are not displayed.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => setState(() => _showImages = true),
                      child: const Text('Show images'),
                    ),
                  ],
                ),
              ),

            // Message body
            Text(
              'Hi team,\n\n'
              'Here is the update on our Q4 planning. We have made significant '
              'progress on the following items:\n\n'
              '1. Product roadmap has been finalized and approved by the board.\n'
              '2. Resource allocation is complete across all departments.\n'
              '3. Key milestones have been identified for each quarter.\n'
              '4. Risk assessment has been conducted with mitigation plans.\n\n'
              'Please review the attached document and let me know if you have '
              'any questions or concerns before our next meeting on Friday.\n\n'
              'Action items:\n'
              '- Each team lead to confirm their resource needs by Wednesday\n'
              '- Finance to review budget allocations\n'
              '- Marketing to prepare campaign timeline\n\n'
              'Best regards,\n'
              'Alice Johnson\n'
              'VP of Product',
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
            ),

            const SizedBox(height: 32),

            // Attachments
            Text(
              'Attachments (2)',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _AttachmentCard(
                  filename: 'Q4_Plan.pdf',
                  size: '2.4 MB',
                  icon: Icons.picture_as_pdf,
                  color: const Color(0xFFDB4437),
                ),
                _AttachmentCard(
                  filename: 'budget_2024.xlsx',
                  size: '856 KB',
                  icon: Icons.table_chart,
                  color: const Color(0xFF0F9D58),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Quick reply
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.reply, size: 18),
                    label: const Text('Reply'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.forward, size: 18),
                    label: const Text('Forward'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AttachmentCard extends StatelessWidget {
  const _AttachmentCard({
    required this.filename,
    required this.size,
    required this.icon,
    required this.color,
  });

  final String filename;
  final String size;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filename,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  size,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.download, size: 20),
            onPressed: () {},
            tooltip: 'Download',
          ),
        ],
      ),
    );
  }
}

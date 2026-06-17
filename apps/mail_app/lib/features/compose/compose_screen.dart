import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Compose email screen with rich text editing and attachment support.
class ComposeScreen extends ConsumerStatefulWidget {
  const ComposeScreen({super.key});

  @override
  ConsumerState<ComposeScreen> createState() => _ComposeScreenState();
}

class _ComposeScreenState extends ConsumerState<ComposeScreen> {
  final _toController = TextEditingController();
  final _ccController = TextEditingController();
  final _bccController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  bool _showCcBcc = false;
  bool _isSending = false;
  final List<String> _attachments = [];

  @override
  void dispose() {
    _toController.dispose();
    _ccController.dispose();
    _bccController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Message'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _confirmDiscard(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: _addAttachment,
            tooltip: 'Attach file',
          ),
          IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: _saveDraft,
            tooltip: 'Save draft',
          ),
          const SizedBox(width: 8),
          FilledButton.icon(
            onPressed: _isSending ? null : _send,
            icon: const Icon(Icons.send, size: 18),
            label: const Text('Send'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Recipients
          _RecipientField(
            label: 'To',
            controller: _toController,
            trailing: !_showCcBcc
                ? TextButton(
                    onPressed: () => setState(() => _showCcBcc = true),
                    child: const Text('Cc/Bcc'),
                  )
                : null,
          ),
          if (_showCcBcc) ...[
            _RecipientField(
              label: 'Cc',
              controller: _ccController,
            ),
            _RecipientField(
              label: 'Bcc',
              controller: _bccController,
            ),
          ],
          const Divider(height: 1),

          // Subject
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                hintText: 'Subject',
                border: InputBorder.none,
              ),
              style: theme.textTheme.titleMedium,
            ),
          ),
          const Divider(height: 1),

          // Body editor
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _bodyController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText: 'Write your message...',
                  border: InputBorder.none,
                ),
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
            ),
          ),

          // Attachments
          if (_attachments.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                border: Border(
                  top: BorderSide(color: theme.colorScheme.outlineVariant),
                ),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _attachments.map((file) {
                  return Chip(
                    avatar: const Icon(Icons.insert_drive_file, size: 18),
                    label: Text(file),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () {
                      setState(() => _attachments.remove(file));
                    },
                  );
                }).toList(),
              ),
            ),

          if (_isSending)
            const LinearProgressIndicator(),
        ],
      ),
    );
  }

  void _addAttachment() {
    // TODO: Use file_picker to select files
    setState(() {
      _attachments.add('document.pdf');
    });
  }

  void _saveDraft() {
    // TODO: Save to drafts folder
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Draft saved')),
    );
  }

  Future<void> _send() async {
    if (_toController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one recipient')),
      );
      return;
    }

    setState(() => _isSending = true);

    try {
      // TODO: Implement actual sending via SMTP
      await Future<void>.delayed(const Duration(seconds: 2));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent')),
        );
        context.go('/inbox');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Send failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  void _confirmDiscard(BuildContext context) {
    if (_toController.text.isEmpty &&
        _subjectController.text.isEmpty &&
        _bodyController.text.isEmpty) {
      context.go('/inbox');
      return;
    }

    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard draft?'),
        content: const Text('Your message will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Keep editing'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
              context.go('/inbox');
            },
            child: const Text('Discard'),
          ),
        ],
      ),
    );
  }
}

class _RecipientField extends StatelessWidget {
  const _RecipientField({
    required this.label,
    required this.controller,
    this.trailing,
  });

  final String label;
  final TextEditingController controller;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}


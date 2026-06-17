import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Search screen with local FTS5 and IMAP SEARCH support.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  String _searchScope = 'all';
  final List<_SearchResult> _results = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search mail...',
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _results.clear());
                    },
                  )
                : null,
          ),
          onChanged: _onSearchChanged,
          onSubmitted: _performSearch,
        ),
      ),
      body: Column(
        children: [
          // Search scope chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _ScopeChip(
                  label: 'All Mail',
                  isSelected: _searchScope == 'all',
                  onTap: () => setState(() => _searchScope = 'all'),
                ),
                const SizedBox(width: 8),
                _ScopeChip(
                  label: 'Inbox',
                  isSelected: _searchScope == 'inbox',
                  onTap: () => setState(() => _searchScope = 'inbox'),
                ),
                const SizedBox(width: 8),
                _ScopeChip(
                  label: 'Sent',
                  isSelected: _searchScope == 'sent',
                  onTap: () => setState(() => _searchScope = 'sent'),
                ),
                const SizedBox(width: 8),
                _ScopeChip(
                  label: 'Has Attachment',
                  isSelected: _searchScope == 'attachment',
                  onTap: () => setState(() => _searchScope = 'attachment'),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Results
          Expanded(
            child: _isSearching
                ? const Center(child: CircularProgressIndicator())
                : _results.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 64,
                              color: theme.colorScheme.surfaceContainerHighest,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Search your mail',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Search by sender, subject, or content',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _results.length,
                        itemBuilder: (context, index) {
                          final result = _results[index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(result.senderName[0].toUpperCase()),
                            ),
                            title: Text(
                              result.subject,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              '${result.senderName} — ${result.preview}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(
                              result.date,
                              style: theme.textTheme.bodySmall,
                            ),
                            onTap: () {},
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  void _onSearchChanged(String query) {
    setState(() {});
  }

  void _performSearch(String query) {
    if (query.isEmpty) return;

    setState(() => _isSearching = true);

    // TODO: Implement actual search using local FTS5 + IMAP SEARCH
    Future<void>.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isSearching = false;
          _results.addAll([
            _SearchResult(
              senderName: 'Alice Johnson',
              subject: 'Project Update: Q4 Planning',
              preview: 'Here is the update on our Q4 planning...',
              date: 'Today',
            ),
            _SearchResult(
              senderName: 'Bob Smith',
              subject: 'Re: Meeting tomorrow',
              preview: 'Sounds good! Let me check my calendar...',
              date: 'Yesterday',
            ),
          ]);
        });
      }
    });
  }
}

class _ScopeChip extends StatelessWidget {
  const _ScopeChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}

class _SearchResult {
  const _SearchResult({
    required this.senderName,
    required this.subject,
    required this.preview,
    required this.date,
  });

  final String senderName;
  final String subject;
  final String preview;
  final String date;
}

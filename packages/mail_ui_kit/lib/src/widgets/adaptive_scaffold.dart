import 'package:flutter/material.dart';
import '../responsive/breakpoints.dart';

/// Responsive three-column mail scaffold.
/// Adapts layout based on screen width:
/// - Compact: Single column with drawer
/// - Medium: Two columns (sidebar + content)
/// - Expanded/Large: Three columns (sidebar + list + preview)
class AdaptiveMailScaffold extends StatelessWidget {
  const AdaptiveMailScaffold({
    super.key,
    required this.layoutType,
    required this.sidebar,
    required this.messageList,
    required this.messagePreview,
    this.drawerKey,
  });

  final LayoutType layoutType;
  final Widget sidebar;
  final Widget messageList;
  final Widget messagePreview;
  final GlobalKey<ScaffoldState>? drawerKey;

  @override
  Widget build(BuildContext context) {
    switch (layoutType) {
      case LayoutType.compact:
        return _buildCompact(context);
      case LayoutType.medium:
        return _buildMedium(context);
      case LayoutType.expanded:
      case LayoutType.large:
        return _buildExpanded(context);
    }
  }

  Widget _buildCompact(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: SizedBox(width: 280, child: sidebar),
      body: messageList,
    );
  }

  Widget _buildMedium(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: 260, child: sidebar),
          const VerticalDivider(width: 1),
          Expanded(child: messageList),
        ],
      ),
    );
  }

  Widget _buildExpanded(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(width: 260, child: sidebar),
          const VerticalDivider(width: 1),
          SizedBox(width: 380, child: messageList),
          const VerticalDivider(width: 1),
          Expanded(child: messagePreview),
        ],
      ),
    );
  }
}

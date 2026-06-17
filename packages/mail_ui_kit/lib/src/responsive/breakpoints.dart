import 'package:flutter/material.dart';

/// Responsive breakpoints for the mail client.
class Breakpoints {
  static const double compact = 600;
  static const double medium = 1024;
  static const double expanded = 1440;
}

/// Layout type based on screen width.
enum LayoutType {
  compact,   // < 600px (phone portrait)
  medium,    // 600-1024px (tablet, phone landscape)
  expanded,  // 1024-1440px (small desktop)
  large,     // > 1440px (large desktop)
}

/// Resolve the current layout type from BuildContext.
class LayoutResolver {
  static LayoutType resolve(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < Breakpoints.compact) return LayoutType.compact;
    if (width < Breakpoints.medium) return LayoutType.medium;
    if (width < Breakpoints.expanded) return LayoutType.expanded;
    return LayoutType.large;
  }
}

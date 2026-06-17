/// HTML sanitizer for safely rendering email HTML content.
class HtmlSanitizer {
  /// Allowed HTML tags for email rendering.
  static const _allowedTags = {
    'p', 'div', 'span', 'table', 'tr', 'td', 'th', 'tbody', 'thead', 'tfoot',
    'img', 'a', 'ul', 'ol', 'li', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
    'br', 'hr', 'blockquote', 'pre', 'code', 'strong', 'b', 'em', 'i', 'u',
    'sub', 'sup', 'font', 'center', 'caption',
  };

  /// Allowed HTML attributes.
  static const _allowedAttributes = {
    'style', 'class', 'href', 'src', 'alt', 'width', 'height',
    'colspan', 'rowspan', 'align', 'valign', 'bgcolor', 'color',
    'face', 'size', 'border', 'cellpadding', 'cellspacing',
  };

  /// Dangerous URL protocols.
  static const _dangerousProtocols = {'javascript:', 'vbscript:', 'data:'};

  /// Sanitize HTML content for safe rendering.
  static String sanitize(String html) {
    if (html.isEmpty) return '';

    var sanitized = html;

    // Remove script tags and their content
    sanitized = sanitized.replaceAll(
      RegExp(r'<script[^>]*>[\s\S]*?</script>', caseSensitive: false),
      '',
    );

    // Remove style tags (keep inline styles)
    sanitized = sanitized.replaceAll(
      RegExp(r'<style[^>]*>[\s\S]*?</style>', caseSensitive: false),
      '',
    );

    // Remove event handlers (onclick, onload, onerror, etc.)
    sanitized = sanitized.replaceAll(
      RegExp(r'\s+on\w+\s*=\s*["\'][^"\']*["\']', caseSensitive: false),
      '',
    );
    sanitized = sanitized.replaceAll(
      RegExp(r'\s+on\w+\s*=\s*\w+', caseSensitive: false),
      '',
    );

    // Remove dangerous URL protocols from href and src
    for (final protocol in _dangerousProtocols) {
      sanitized = sanitized.replaceAll(
        RegExp('href\\s*=\\s*["\']$protocol', caseSensitive: false),
        'href="',
      );
      sanitized = sanitized.replaceAll(
        RegExp('src\\s*=\\s*["\']$protocol', caseSensitive: false),
        'src="',
      );
    }

    // Remove iframe, object, embed, form, input tags
    sanitized = sanitized.replaceAll(
      RegExp(r'<(iframe|object|embed|form|input|textarea|select|button)[^>]*>[\s\S]*?</\1>',
          caseSensitive: false),
      '',
    );
    sanitized = sanitized.replaceAll(
      RegExp(r'<(iframe|object|embed|form|input|textarea|select|button)[^>]*/?>',
          caseSensitive: false),
      '',
    );

    // Remove meta refresh
    sanitized = sanitized.replaceAll(
      RegExp(r'<meta[^>]*http-equiv\s*=\s*["\']refresh["\'][^>]*>', caseSensitive: false),
      '',
    );

    return sanitized;
  }

  /// Check if a URL is safe for rendering.
  static bool isSafeUrl(String url) {
    final lower = url.toLowerCase().trim();
    for (final protocol in _dangerousProtocols) {
      if (lower.startsWith(protocol)) return false;
    }
    return true;
  }

  /// Extract plain text from HTML.
  static String htmlToPlainText(String html) {
    var text = html;
    text = text.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n');
    text = text.replaceAll(RegExp(r'<p[^>]*>', caseSensitive: false), '\n');
    text = text.replaceAll(RegExp(r'</p>', caseSensitive: false), '\n');
    text = text.replaceAll(RegExp(r'<[^>]+>'), '');
    text = text.replaceAll('&nbsp;', ' ');
    text = text.replaceAll('&amp;', '&');
    text = text.replaceAll('&lt;', '<');
    text = text.replaceAll('&gt;', '>');
    text = text.replaceAll('&quot;', '"');
    text = text.replaceAll('\n{3,}', '\n\n');
    return text.trim();
  }
}

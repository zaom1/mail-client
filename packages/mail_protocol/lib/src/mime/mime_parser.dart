import 'package:enough_mail/enough_mail.dart';

/// MIME message parser and utility functions.
class MimeParser {
  /// Convert a MimeMessage to a structured email model.
  static Map<String, dynamic> parseMessage(MimeMessage message) {
    return {
      'subject': message.decodeSubject() ?? '',
      'from': _parseAddress(message.from),
      'to': message.to?.map(_parseAddress).toList() ?? [],
      'cc': message.cc?.map(_parseAddress).toList() ?? [],
      'bcc': message.bcc?.map(_parseAddress).toList() ?? [],
      'date': message.decodeDate(),
      'bodyHtml': message.decodeHtmlTextPart(),
      'bodyText': message.decodeTextPlainPart(),
      'attachments': _parseAttachments(message),
      'messageId': message.headerValue('Message-ID'),
      'inReplyTo': message.headerValue('In-Reply-To'),
    };
  }

  static Map<String, String?> _parseAddress(MailAddress? address) {
    if (address == null) return {'email': '', 'name': null};
    return {
      'email': address.email,
      'name': address.personalName,
    };
  }

  static List<Map<String, dynamic>> _parseAttachments(MimeMessage message) {
    final attachments = <Map<String, dynamic>>[];
    final parts = message.parts;
    if (parts != null) {
      for (final part in parts) {
        final disposition = part.headerValue('Content-Disposition');
        if (disposition != null && disposition.toLowerCase().contains('attachment')) {
          attachments.add({
            'filename': part.filename ?? 'unnamed',
            'mimeType': part.contentType?.mimeType ?? 'application/octet-stream',
            'size': part.size,
            'contentId': part.contentId,
            'isInline': disposition.toLowerCase().contains('inline'),
          });
        }
      }
    }
    return attachments;
  }

  /// Extract preview text from a message.
  static String getPreviewText(MimeMessage message, {int maxLength = 200}) {
    final text = message.decodeTextPlainPart() ?? message.decodeHtmlTextPart() ?? '';
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
}

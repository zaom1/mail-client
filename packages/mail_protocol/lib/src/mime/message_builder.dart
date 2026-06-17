import 'package:enough_mail/enough_mail.dart';

/// Builder for constructing MIME email messages.
class MessageBuilder {
  /// Build a simple text email.
  static MimeMessage buildTextMessage({
    required MailAddress from,
    required List<MailAddress> to,
    List<MailAddress>? cc,
    List<MailAddress>? bcc,
    required String subject,
    required String body,
    String? replyToMessageId,
    String? inReplyTo,
  }) {
    final builder = MessageBuilder();
    final message = MimeMessage();

    message.from = from;
    message.to = to;
    if (cc != null) message.cc = cc;
    if (bcc != null) message.bcc = bcc;
    message.subject = subject;

    if (inReplyTo != null) {
      message.addHeader('In-Reply-To', inReplyTo);
    }

    final textPart = MimePart()
      ..contentType = MediaType.textPlain
      ..setContentText(body);

    message.addPart(textPart);
    return message;
  }

  /// Build an HTML email with plain text fallback.
  static MimeMessage buildHtmlMessage({
    required MailAddress from,
    required List<MailAddress> to,
    List<MailAddress>? cc,
    List<MailAddress>? bcc,
    required String subject,
    required String htmlBody,
    String? plainTextBody,
    String? inReplyTo,
  }) {
    final message = MimeMessage();

    message.from = from;
    message.to = to;
    if (cc != null) message.cc = cc;
    if (bcc != null) message.bcc = bcc;
    message.subject = subject;

    if (inReplyTo != null) {
      message.addHeader('In-Reply-To', inReplyTo);
    }

    // Create multipart/alternative with plain text and HTML
    final alternative = MimePart()
      ..contentType = MediaType.multipartAlternative;

    if (plainTextBody != null) {
      final textPart = MimePart()
        ..contentType = MediaType.textPlain
        ..setContentText(plainTextBody);
      alternative.addPart(textPart);
    }

    final htmlPart = MimePart()
      ..contentType = MediaType.textHtml
      ..setContentText(htmlBody);
    alternative.addPart(htmlPart);

    message.addPart(alternative);
    return message;
  }

  /// Build a reply message.
  static MimeMessage buildReply({
    required MailAddress from,
    required MimeMessage originalMessage,
    required String body,
    bool replyAll = false,
  }) {
    final to = <MailAddress>[];

    // Reply to sender
    if (originalMessage.from != null) {
      to.add(originalMessage.from!);
    }

    // Reply all includes original CC
    if (replyAll && originalMessage.cc != null) {
      to.addAll(originalMessage.cc!);
    }

    final subject = 'Re: ${originalMessage.decodeSubject() ?? ''}';
    final originalText = originalMessage.decodeTextPlainPart() ?? '';
    final quotedText = originalText
        .split('\n')
        .map((line) => '> $line')
        .join('\n');

    return buildTextMessage(
      from: from,
      to: to,
      subject: subject,
      body: '$body\n\n--- Original Message ---\n$quotedText',
      inReplyTo: originalMessage.headerValue('Message-ID'),
    );
  }

  /// Build a forward message.
  static MimeMessage buildForward({
    required MailAddress from,
    required MimeMessage originalMessage,
    required String body,
  }) {
    final subject = 'Fwd: ${originalMessage.decodeSubject() ?? ''}';
    final originalText = originalMessage.decodeTextPlainPart() ?? '';

    final forwardBody = '''$body

---------- Forwarded message ----------
From: ${originalMessage.from?.email ?? 'Unknown'}
Date: ${originalMessage.decodeDate()}
Subject: ${originalMessage.decodeSubject() ?? ''}
To: ${originalMessage.to?.map((a) => a.email).join(', ') ?? ''}

$originalText''';

    return buildTextMessage(
      from: from,
      to: [], // User needs to fill in recipients
      subject: subject,
      body: forwardBody,
    );
  }
}

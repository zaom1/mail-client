import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/enums.dart';

part 'message.freezed.dart';
part 'message.g.dart';

/// Email message.
@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String accountId,
    required String folderId,
    required int uid,
    String? messageId,
    String? subject,
    EmailAddress? from,
    @Default(<EmailAddress>[]) List<EmailAddress> to,
    @Default(<EmailAddress>[]) List<EmailAddress> cc,
    @Default(<EmailAddress>[]) List<EmailAddress> bcc,
    EmailAddress? replyTo,
    required DateTime date,
    @Default(false) bool isRead,
    @Default(false) bool isFlagged,
    @Default(false) bool isAnswered,
    @Default(false) bool isForwarded,
    @Default(false) bool hasAttachments,
    String? previewText,
    String? bodyHtml,
    String? bodyText,
    @Default(0) int size,
    @Default(<MessageFlag>[]) List<MessageFlag> flags,
    String? inReplyTo,
    @Default(<String>[]) List<String> references,
    @Default(<Attachment>[]) List<Attachment> attachments,
    @Default(SyncStatus.synced) SyncStatus syncStatus,
    required DateTime createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  const Message._();

  /// Get the sender's display name or email.
  String get senderDisplay => from?.name ?? from?.email ?? 'Unknown';

  /// Whether this message is a draft.
  bool get isDraft => flags.contains(MessageFlag.draft);

  /// Get the best available body content.
  String? get bestBody => bodyHtml ?? bodyText;
}

/// Email address with optional display name.
@freezed
class EmailAddress with _$EmailAddress {
  const factory EmailAddress({
    required String email,
    String? name,
  }) = _EmailAddress;

  factory EmailAddress.fromJson(Map<String, dynamic> json) =>
      _$EmailAddressFromJson(json);

  const EmailAddress._();

  /// Display string: "Name <email>" or just "email".
  String get display => name != null && name!.isNotEmpty
      ? '$name <$email>'
      : email;

  /// Short display: name or email prefix.
  String get shortDisplay => name?.split(' ').first ?? email.split('@').first;
}

/// Email attachment.
@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    required String id,
    required String messageId,
    String? filename,
    String? mimeType,
    @Default(0) int size,
    String? contentId,
    @Default(false) bool isInline,
    String? localPath,
    @Default(DownloadStatus.notDownloaded) DownloadStatus downloadStatus,
    double? downloadProgress,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  const Attachment._();

  /// Human-readable file size.
  String get humanSize {
    if (size <= 0) return '';
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) {
      return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Whether this is an image attachment.
  bool get isImage => mimeType?.startsWith('image/') ?? false;
}

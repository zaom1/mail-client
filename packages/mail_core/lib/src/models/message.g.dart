// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      folderId: json['folderId'] as String,
      uid: (json['uid'] as num).toInt(),
      messageId: json['messageId'] as String?,
      subject: json['subject'] as String?,
      from: json['from'] == null
          ? null
          : EmailAddress.fromJson(json['from'] as Map<String, dynamic>),
      to: (json['to'] as List<dynamic>?)
              ?.map((e) => EmailAddress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EmailAddress>[],
      cc: (json['cc'] as List<dynamic>?)
              ?.map((e) => EmailAddress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EmailAddress>[],
      bcc: (json['bcc'] as List<dynamic>?)
              ?.map((e) => EmailAddress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <EmailAddress>[],
      replyTo: json['replyTo'] == null
          ? null
          : EmailAddress.fromJson(json['replyTo'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      isRead: json['isRead'] as bool? ?? false,
      isFlagged: json['isFlagged'] as bool? ?? false,
      isAnswered: json['isAnswered'] as bool? ?? false,
      isForwarded: json['isForwarded'] as bool? ?? false,
      hasAttachments: json['hasAttachments'] as bool? ?? false,
      previewText: json['previewText'] as String?,
      bodyHtml: json['bodyHtml'] as String?,
      bodyText: json['bodyText'] as String?,
      size: (json['size'] as num?)?.toInt() ?? 0,
      flags: (json['flags'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$MessageFlagEnumMap, e))
              .toList() ??
          const <MessageFlag>[],
      inReplyTo: json['inReplyTo'] as String?,
      references: (json['references'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Attachment>[],
      syncStatus:
          $enumDecodeNullable(_$SyncStatusEnumMap, json['syncStatus']) ??
              SyncStatus.synced,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'folderId': instance.folderId,
      'uid': instance.uid,
      'messageId': instance.messageId,
      'subject': instance.subject,
      'from': instance.from,
      'to': instance.to,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'replyTo': instance.replyTo,
      'date': instance.date.toIso8601String(),
      'isRead': instance.isRead,
      'isFlagged': instance.isFlagged,
      'isAnswered': instance.isAnswered,
      'isForwarded': instance.isForwarded,
      'hasAttachments': instance.hasAttachments,
      'previewText': instance.previewText,
      'bodyHtml': instance.bodyHtml,
      'bodyText': instance.bodyText,
      'size': instance.size,
      'flags': instance.flags.map((e) => _$MessageFlagEnumMap[e]!).toList(),
      'inReplyTo': instance.inReplyTo,
      'references': instance.references,
      'attachments': instance.attachments,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$MessageFlagEnumMap = {
  MessageFlag.seen: 'seen',
  MessageFlag.answered: 'answered',
  MessageFlag.flagged: 'flagged',
  MessageFlag.deleted: 'deleted',
  MessageFlag.draft: 'draft',
  MessageFlag.recent: 'recent',
  MessageFlag.forwarded: 'forwarded',
};

const _$SyncStatusEnumMap = {
  SyncStatus.synced: 'synced',
  SyncStatus.pending: 'pending',
  SyncStatus.conflict: 'conflict',
  SyncStatus.error: 'error',
};

_$EmailAddressImpl _$$EmailAddressImplFromJson(Map<String, dynamic> json) =>
    _$EmailAddressImpl(
      email: json['email'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$EmailAddressImplToJson(_$EmailAddressImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
    };

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      id: json['id'] as String,
      messageId: json['messageId'] as String,
      filename: json['filename'] as String?,
      mimeType: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt() ?? 0,
      contentId: json['contentId'] as String?,
      isInline: json['isInline'] as bool? ?? false,
      localPath: json['localPath'] as String?,
      downloadStatus: $enumDecodeNullable(
              _$DownloadStatusEnumMap, json['downloadStatus']) ??
          DownloadStatus.notDownloaded,
      downloadProgress: (json['downloadProgress'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messageId': instance.messageId,
      'filename': instance.filename,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'contentId': instance.contentId,
      'isInline': instance.isInline,
      'localPath': instance.localPath,
      'downloadStatus': _$DownloadStatusEnumMap[instance.downloadStatus]!,
      'downloadProgress': instance.downloadProgress,
    };

const _$DownloadStatusEnumMap = {
  DownloadStatus.pending: 'pending',
  DownloadStatus.downloading: 'downloading',
  DownloadStatus.completed: 'completed',
  DownloadStatus.failed: 'failed',
  DownloadStatus.notDownloaded: 'notDownloaded',
};

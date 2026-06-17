// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      source: json['source'] as String? ?? 'auto',
      frequency: (json['frequency'] as num?)?.toInt() ?? 1,
      lastContactAt: json['lastContactAt'] == null
          ? null
          : DateTime.parse(json['lastContactAt'] as String),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'source': instance.source,
      'frequency': instance.frequency,
      'lastContactAt': instance.lastContactAt?.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
    };

_$OutboxMessageImpl _$$OutboxMessageImplFromJson(Map<String, dynamic> json) =>
    _$OutboxMessageImpl(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      rawMime: json['rawMime'] as String,
      subject: json['subject'] as String?,
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
      status: $enumDecodeNullable(_$SendStatusEnumMap, json['status']) ??
          SendStatus.queued,
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      errorMessage: json['errorMessage'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$$OutboxMessageImplToJson(_$OutboxMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'rawMime': instance.rawMime,
      'subject': instance.subject,
      'to': instance.to,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'status': _$SendStatusEnumMap[instance.status]!,
      'retryCount': instance.retryCount,
      'errorMessage': instance.errorMessage,
      'createdAt': instance.createdAt.toIso8601String(),
      'sentAt': instance.sentAt?.toIso8601String(),
    };

const _$SendStatusEnumMap = {
  SendStatus.queued: 'queued',
  SendStatus.sending: 'sending',
  SendStatus.sent: 'sent',
  SendStatus.failed: 'failed',
  SendStatus.draft: 'draft',
};

_$ServerConfigImpl _$$ServerConfigImplFromJson(Map<String, dynamic> json) =>
    _$ServerConfigImpl(
      host: json['host'] as String,
      port: (json['port'] as num).toInt(),
      ssl: json['ssl'] as bool? ?? true,
      startTls: json['startTls'] as bool? ?? false,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$ServerConfigImplToJson(_$ServerConfigImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'ssl': instance.ssl,
      'startTls': instance.startTls,
      'username': instance.username,
    };

_$AutoConfigImpl _$$AutoConfigImplFromJson(Map<String, dynamic> json) =>
    _$AutoConfigImpl(
      domain: json['domain'] as String,
      imap: json['imap'] == null
          ? null
          : ServerConfig.fromJson(json['imap'] as Map<String, dynamic>),
      smtp: json['smtp'] == null
          ? null
          : ServerConfig.fromJson(json['smtp'] as Map<String, dynamic>),
      pop3: json['pop3'] == null
          ? null
          : ServerConfig.fromJson(json['pop3'] as Map<String, dynamic>),
      provider: $enumDecodeNullable(_$MailProviderEnumMap, json['provider']),
    );

Map<String, dynamic> _$$AutoConfigImplToJson(_$AutoConfigImpl instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'imap': instance.imap,
      'smtp': instance.smtp,
      'pop3': instance.pop3,
      'provider': _$MailProviderEnumMap[instance.provider],
    };

const _$MailProviderEnumMap = {
  MailProvider.gmail: 'gmail',
  MailProvider.outlook: 'outlook',
  MailProvider.icloud: 'icloud',
  MailProvider.yahoo: 'yahoo',
  MailProvider.aol: 'aol',
  MailProvider.qq: 'qq',
  MailProvider.netease163: 'netease163',
  MailProvider.netease126: 'netease126',
  MailProvider.custom: 'custom',
};

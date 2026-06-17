// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String? ?? '',
      provider: $enumDecode(_$MailProviderEnumMap, json['provider']),
      protocol: $enumDecode(_$MailProtocolEnumMap, json['protocol']),
      authMethod: $enumDecode(_$AuthMethodEnumMap, json['authMethod']),
      imapHost: json['imapHost'] as String?,
      imapPort: (json['imapPort'] as num?)?.toInt() ?? 993,
      imapSsl: json['imapSsl'] as bool? ?? true,
      smtpHost: json['smtpHost'] as String?,
      smtpPort: (json['smtpPort'] as num?)?.toInt() ?? 587,
      smtpSsl: json['smtpSsl'] as bool? ?? false,
      smtpStartTls: json['smtpStartTls'] as bool? ?? true,
      pop3Host: json['pop3Host'] as String?,
      pop3Port: (json['pop3Port'] as num?)?.toInt() ?? 995,
      pop3Ssl: json['pop3Ssl'] as bool? ?? true,
      oauthProvider: json['oauthProvider'] as String?,
      refreshToken: json['refreshToken'] as String?,
      syncIntervalMinutes: (json['syncIntervalMinutes'] as num?)?.toInt() ?? 15,
      syncDaysBack: (json['syncDaysBack'] as num?)?.toInt() ?? 30,
      isActive: json['isActive'] as bool? ?? true,
      isDefault: json['isDefault'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'provider': _$MailProviderEnumMap[instance.provider]!,
      'protocol': _$MailProtocolEnumMap[instance.protocol]!,
      'authMethod': _$AuthMethodEnumMap[instance.authMethod]!,
      'imapHost': instance.imapHost,
      'imapPort': instance.imapPort,
      'imapSsl': instance.imapSsl,
      'smtpHost': instance.smtpHost,
      'smtpPort': instance.smtpPort,
      'smtpSsl': instance.smtpSsl,
      'smtpStartTls': instance.smtpStartTls,
      'pop3Host': instance.pop3Host,
      'pop3Port': instance.pop3Port,
      'pop3Ssl': instance.pop3Ssl,
      'oauthProvider': instance.oauthProvider,
      'refreshToken': instance.refreshToken,
      'syncIntervalMinutes': instance.syncIntervalMinutes,
      'syncDaysBack': instance.syncDaysBack,
      'isActive': instance.isActive,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
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

const _$MailProtocolEnumMap = {
  MailProtocol.imap: 'imap',
  MailProtocol.pop3: 'pop3',
  MailProtocol.exchange: 'exchange',
  MailProtocol.graphApi: 'graphApi',
  MailProtocol.gmailApi: 'gmailApi',
};

const _$AuthMethodEnumMap = {
  AuthMethod.oauth2: 'oauth2',
  AuthMethod.password: 'password',
  AuthMethod.appSpecificPassword: 'appSpecificPassword',
  AuthMethod.xoauth2: 'xoauth2',
};

_$AccountStatusImpl _$$AccountStatusImplFromJson(Map<String, dynamic> json) =>
    _$AccountStatusImpl(
      accountId: json['accountId'] as String,
      isConnected: json['isConnected'] as bool? ?? false,
      isSyncing: json['isSyncing'] as bool? ?? false,
      lastError: json['lastError'] as String?,
      lastSyncAt: json['lastSyncAt'] == null
          ? null
          : DateTime.parse(json['lastSyncAt'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AccountStatusImplToJson(_$AccountStatusImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'isConnected': instance.isConnected,
      'isSyncing': instance.isSyncing,
      'lastError': instance.lastError,
      'lastSyncAt': instance.lastSyncAt?.toIso8601String(),
      'unreadCount': instance.unreadCount,
    };

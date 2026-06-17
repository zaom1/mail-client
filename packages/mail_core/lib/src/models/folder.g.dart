// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String?,
      folderType: $enumDecodeNullable(_$FolderTypeEnumMap, json['folderType']),
      parentId: json['parentId'] as String?,
      uidValidity: (json['uidValidity'] as num?)?.toInt(),
      uidNext: (json['uidNext'] as num?)?.toInt(),
      messageCount: (json['messageCount'] as num?)?.toInt() ?? 0,
      unseenCount: (json['unseenCount'] as num?)?.toInt() ?? 0,
      isSubscribed: json['isSubscribed'] as bool? ?? true,
      lastSyncAt: json['lastSyncAt'] == null
          ? null
          : DateTime.parse(json['lastSyncAt'] as String),
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'name': instance.name,
      'displayName': instance.displayName,
      'folderType': _$FolderTypeEnumMap[instance.folderType],
      'parentId': instance.parentId,
      'uidValidity': instance.uidValidity,
      'uidNext': instance.uidNext,
      'messageCount': instance.messageCount,
      'unseenCount': instance.unseenCount,
      'isSubscribed': instance.isSubscribed,
      'lastSyncAt': instance.lastSyncAt?.toIso8601String(),
      'children': instance.children,
    };

const _$FolderTypeEnumMap = {
  FolderType.inbox: 'inbox',
  FolderType.sent: 'sent',
  FolderType.drafts: 'drafts',
  FolderType.trash: 'trash',
  FolderType.junk: 'junk',
  FolderType.archive: 'archive',
  FolderType.all: 'all',
  FolderType.flagged: 'flagged',
  FolderType.custom: 'custom',
};

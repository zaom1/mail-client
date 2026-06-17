// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Folder _$FolderFromJson(Map<String, dynamic> json) {
  return _Folder.fromJson(json);
}

/// @nodoc
mixin _$Folder {
  String get id => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  FolderType? get folderType => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int? get uidValidity => throw _privateConstructorUsedError;
  int? get uidNext => throw _privateConstructorUsedError;
  int get messageCount => throw _privateConstructorUsedError;
  int get unseenCount => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;
  DateTime? get lastSyncAt => throw _privateConstructorUsedError;
  List<String> get children => throw _privateConstructorUsedError;

  /// Serializes this Folder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderCopyWith<Folder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderCopyWith<$Res> {
  factory $FolderCopyWith(Folder value, $Res Function(Folder) then) =
      _$FolderCopyWithImpl<$Res, Folder>;
  @useResult
  $Res call(
      {String id,
      String accountId,
      String name,
      String? displayName,
      FolderType? folderType,
      String? parentId,
      int? uidValidity,
      int? uidNext,
      int messageCount,
      int unseenCount,
      bool isSubscribed,
      DateTime? lastSyncAt,
      List<String> children});
}

/// @nodoc
class _$FolderCopyWithImpl<$Res, $Val extends Folder>
    implements $FolderCopyWith<$Res> {
  _$FolderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? displayName = freezed,
    Object? folderType = freezed,
    Object? parentId = freezed,
    Object? uidValidity = freezed,
    Object? uidNext = freezed,
    Object? messageCount = null,
    Object? unseenCount = null,
    Object? isSubscribed = null,
    Object? lastSyncAt = freezed,
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      folderType: freezed == folderType
          ? _value.folderType
          : folderType // ignore: cast_nullable_to_non_nullable
              as FolderType?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      uidValidity: freezed == uidValidity
          ? _value.uidValidity
          : uidValidity // ignore: cast_nullable_to_non_nullable
              as int?,
      uidNext: freezed == uidNext
          ? _value.uidNext
          : uidNext // ignore: cast_nullable_to_non_nullable
              as int?,
      messageCount: null == messageCount
          ? _value.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      unseenCount: null == unseenCount
          ? _value.unseenCount
          : unseenCount // ignore: cast_nullable_to_non_nullable
              as int,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderImplCopyWith<$Res> implements $FolderCopyWith<$Res> {
  factory _$$FolderImplCopyWith(
          _$FolderImpl value, $Res Function(_$FolderImpl) then) =
      __$$FolderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String accountId,
      String name,
      String? displayName,
      FolderType? folderType,
      String? parentId,
      int? uidValidity,
      int? uidNext,
      int messageCount,
      int unseenCount,
      bool isSubscribed,
      DateTime? lastSyncAt,
      List<String> children});
}

/// @nodoc
class __$$FolderImplCopyWithImpl<$Res>
    extends _$FolderCopyWithImpl<$Res, _$FolderImpl>
    implements _$$FolderImplCopyWith<$Res> {
  __$$FolderImplCopyWithImpl(
      _$FolderImpl _value, $Res Function(_$FolderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? name = null,
    Object? displayName = freezed,
    Object? folderType = freezed,
    Object? parentId = freezed,
    Object? uidValidity = freezed,
    Object? uidNext = freezed,
    Object? messageCount = null,
    Object? unseenCount = null,
    Object? isSubscribed = null,
    Object? lastSyncAt = freezed,
    Object? children = null,
  }) {
    return _then(_$FolderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      folderType: freezed == folderType
          ? _value.folderType
          : folderType // ignore: cast_nullable_to_non_nullable
              as FolderType?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      uidValidity: freezed == uidValidity
          ? _value.uidValidity
          : uidValidity // ignore: cast_nullable_to_non_nullable
              as int?,
      uidNext: freezed == uidNext
          ? _value.uidNext
          : uidNext // ignore: cast_nullable_to_non_nullable
              as int?,
      messageCount: null == messageCount
          ? _value.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int,
      unseenCount: null == unseenCount
          ? _value.unseenCount
          : unseenCount // ignore: cast_nullable_to_non_nullable
              as int,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderImpl extends _Folder {
  const _$FolderImpl(
      {required this.id,
      required this.accountId,
      required this.name,
      this.displayName,
      this.folderType,
      this.parentId,
      this.uidValidity,
      this.uidNext,
      this.messageCount = 0,
      this.unseenCount = 0,
      this.isSubscribed = true,
      this.lastSyncAt,
      final List<String> children = const <String>[]})
      : _children = children,
        super._();

  factory _$FolderImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderImplFromJson(json);

  @override
  final String id;
  @override
  final String accountId;
  @override
  final String name;
  @override
  final String? displayName;
  @override
  final FolderType? folderType;
  @override
  final String? parentId;
  @override
  final int? uidValidity;
  @override
  final int? uidNext;
  @override
  @JsonKey()
  final int messageCount;
  @override
  @JsonKey()
  final int unseenCount;
  @override
  @JsonKey()
  final bool isSubscribed;
  @override
  final DateTime? lastSyncAt;
  final List<String> _children;
  @override
  @JsonKey()
  List<String> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'Folder(id: $id, accountId: $accountId, name: $name, displayName: $displayName, folderType: $folderType, parentId: $parentId, uidValidity: $uidValidity, uidNext: $uidNext, messageCount: $messageCount, unseenCount: $unseenCount, isSubscribed: $isSubscribed, lastSyncAt: $lastSyncAt, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.folderType, folderType) ||
                other.folderType == folderType) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.uidValidity, uidValidity) ||
                other.uidValidity == uidValidity) &&
            (identical(other.uidNext, uidNext) || other.uidNext == uidNext) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount) &&
            (identical(other.unseenCount, unseenCount) ||
                other.unseenCount == unseenCount) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.lastSyncAt, lastSyncAt) ||
                other.lastSyncAt == lastSyncAt) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accountId,
      name,
      displayName,
      folderType,
      parentId,
      uidValidity,
      uidNext,
      messageCount,
      unseenCount,
      isSubscribed,
      lastSyncAt,
      const DeepCollectionEquality().hash(_children));

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      __$$FolderImplCopyWithImpl<_$FolderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderImplToJson(
      this,
    );
  }
}

abstract class _Folder extends Folder {
  const factory _Folder(
      {required final String id,
      required final String accountId,
      required final String name,
      final String? displayName,
      final FolderType? folderType,
      final String? parentId,
      final int? uidValidity,
      final int? uidNext,
      final int messageCount,
      final int unseenCount,
      final bool isSubscribed,
      final DateTime? lastSyncAt,
      final List<String> children}) = _$FolderImpl;
  const _Folder._() : super._();

  factory _Folder.fromJson(Map<String, dynamic> json) = _$FolderImpl.fromJson;

  @override
  String get id;
  @override
  String get accountId;
  @override
  String get name;
  @override
  String? get displayName;
  @override
  FolderType? get folderType;
  @override
  String? get parentId;
  @override
  int? get uidValidity;
  @override
  int? get uidNext;
  @override
  int get messageCount;
  @override
  int get unseenCount;
  @override
  bool get isSubscribed;
  @override
  DateTime? get lastSyncAt;
  @override
  List<String> get children;

  /// Create a copy of Folder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderImplCopyWith<_$FolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

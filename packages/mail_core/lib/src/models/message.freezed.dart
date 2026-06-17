// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  String get folderId => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  String? get messageId => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  EmailAddress? get from => throw _privateConstructorUsedError;
  List<EmailAddress> get to => throw _privateConstructorUsedError;
  List<EmailAddress> get cc => throw _privateConstructorUsedError;
  List<EmailAddress> get bcc => throw _privateConstructorUsedError;
  EmailAddress? get replyTo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  bool get isFlagged => throw _privateConstructorUsedError;
  bool get isAnswered => throw _privateConstructorUsedError;
  bool get isForwarded => throw _privateConstructorUsedError;
  bool get hasAttachments => throw _privateConstructorUsedError;
  String? get previewText => throw _privateConstructorUsedError;
  String? get bodyHtml => throw _privateConstructorUsedError;
  String? get bodyText => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  List<MessageFlag> get flags => throw _privateConstructorUsedError;
  String? get inReplyTo => throw _privateConstructorUsedError;
  List<String> get references => throw _privateConstructorUsedError;
  List<Attachment> get attachments => throw _privateConstructorUsedError;
  SyncStatus get syncStatus => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String id,
      String accountId,
      String folderId,
      int uid,
      String? messageId,
      String? subject,
      EmailAddress? from,
      List<EmailAddress> to,
      List<EmailAddress> cc,
      List<EmailAddress> bcc,
      EmailAddress? replyTo,
      DateTime date,
      bool isRead,
      bool isFlagged,
      bool isAnswered,
      bool isForwarded,
      bool hasAttachments,
      String? previewText,
      String? bodyHtml,
      String? bodyText,
      int size,
      List<MessageFlag> flags,
      String? inReplyTo,
      List<String> references,
      List<Attachment> attachments,
      SyncStatus syncStatus,
      DateTime createdAt});

  $EmailAddressCopyWith<$Res>? get from;
  $EmailAddressCopyWith<$Res>? get replyTo;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? folderId = null,
    Object? uid = null,
    Object? messageId = freezed,
    Object? subject = freezed,
    Object? from = freezed,
    Object? to = null,
    Object? cc = null,
    Object? bcc = null,
    Object? replyTo = freezed,
    Object? date = null,
    Object? isRead = null,
    Object? isFlagged = null,
    Object? isAnswered = null,
    Object? isForwarded = null,
    Object? hasAttachments = null,
    Object? previewText = freezed,
    Object? bodyHtml = freezed,
    Object? bodyText = freezed,
    Object? size = null,
    Object? flags = null,
    Object? inReplyTo = freezed,
    Object? references = null,
    Object? attachments = null,
    Object? syncStatus = null,
    Object? createdAt = null,
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
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as List<EmailAddress>,
      cc: null == cc
          ? _value.cc
          : cc // ignore: cast_nullable_to_non_nullable
              as List<EmailAddress>,
      bcc: null == bcc
          ? _value.bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<EmailAddress>,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      isForwarded: null == isForwarded
          ? _value.isForwarded
          : isForwarded // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAttachments: null == hasAttachments
          ? _value.hasAttachments
          : hasAttachments // ignore: cast_nullable_to_non_nullable
              as bool,
      previewText: freezed == previewText
          ? _value.previewText
          : previewText // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyHtml: freezed == bodyHtml
          ? _value.bodyHtml
          : bodyHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyText: freezed == bodyText
          ? _value.bodyText
          : bodyText // ignore: cast_nullable_to_non_nullable
              as String?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<MessageFlag>,
      inReplyTo: freezed == inReplyTo
          ? _value.inReplyTo
          : inReplyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      references: null == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailAddressCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $EmailAddressCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmailAddressCopyWith<$Res>? get replyTo {
    if (_value.replyTo == null) {
      return null;
    }

    return $EmailAddressCopyWith<$Res>(_value.replyTo!, (value) {
      return _then(_value.copyWith(replyTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String accountId,
      String folderId,
      int uid,
      String? messageId,
      String? subject,
      EmailAddress? from,
      List<EmailAddress> to,
      List<EmailAddress> cc,
      List<EmailAddress> bcc,
      EmailAddress? replyTo,
      DateTime date,
      bool isRead,
      bool isFlagged,
      bool isAnswered,
      bool isForwarded,
      bool hasAttachments,
      String? previewText,
      String? bodyHtml,
      String? bodyText,
      int size,
      List<MessageFlag> flags,
      String? inReplyTo,
      List<String> references,
      List<Attachment> attachments,
      SyncStatus syncStatus,
      DateTime createdAt});

  @override
  $EmailAddressCopyWith<$Res>? get from;
  @override
  $EmailAddressCopyWith<$Res>? get replyTo;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? folderId = null,
    Object? uid = null,
    Object? messageId = freezed,
    Object? subject = freezed,
    Object? from = freezed,
    Object? to = null,
    Object? cc = null,
    Object? bcc = null,
    Object? replyTo = freezed,
    Object? date = null,
    Object? isRead = null,
    Object? isFlagged = null,
    Object? isAnswered = null,
    Object? isForwarded = null,
    Object? hasAttachments = null,
    Object? previewText = freezed,
    Object? bodyHtml = freezed,
    Object? bodyText = freezed,
    Object? size = null,
    Object? flags = null,
    Object? inReplyTo = freezed,
    Object? references = null,
    Object? attachments = null,
    Object? syncStatus = null,
    Object? createdAt = null,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      to: null == to
          ? _value._to
          : to // ignore: cast_nullable_to_non_nullable
              as List<EmailAddress>,
      cc: null == cc
          ? _value._cc
          : cc // ignore: cast_nullable_to_non_nullable
              as List<EmailAddress>,
      bcc: null == bcc
          ? _value._bcc
          : bcc // ignore: cast_nullable_to_non_nullable
              as List<EmailAddress>,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlagged: null == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      isForwarded: null == isForwarded
          ? _value.isForwarded
          : isForwarded // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAttachments: null == hasAttachments
          ? _value.hasAttachments
          : hasAttachments // ignore: cast_nullable_to_non_nullable
              as bool,
      previewText: freezed == previewText
          ? _value.previewText
          : previewText // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyHtml: freezed == bodyHtml
          ? _value.bodyHtml
          : bodyHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyText: freezed == bodyText
          ? _value.bodyText
          : bodyText // ignore: cast_nullable_to_non_nullable
              as String?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      flags: null == flags
          ? _value._flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<MessageFlag>,
      inReplyTo: freezed == inReplyTo
          ? _value.inReplyTo
          : inReplyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      references: null == references
          ? _value._references
          : references // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  const _$MessageImpl(
      {required this.id,
      required this.accountId,
      required this.folderId,
      required this.uid,
      this.messageId,
      this.subject,
      this.from,
      final List<EmailAddress> to = const <EmailAddress>[],
      final List<EmailAddress> cc = const <EmailAddress>[],
      final List<EmailAddress> bcc = const <EmailAddress>[],
      this.replyTo,
      required this.date,
      this.isRead = false,
      this.isFlagged = false,
      this.isAnswered = false,
      this.isForwarded = false,
      this.hasAttachments = false,
      this.previewText,
      this.bodyHtml,
      this.bodyText,
      this.size = 0,
      final List<MessageFlag> flags = const <MessageFlag>[],
      this.inReplyTo,
      final List<String> references = const <String>[],
      final List<Attachment> attachments = const <Attachment>[],
      this.syncStatus = SyncStatus.synced,
      required this.createdAt})
      : _to = to,
        _cc = cc,
        _bcc = bcc,
        _flags = flags,
        _references = references,
        _attachments = attachments,
        super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String id;
  @override
  final String accountId;
  @override
  final String folderId;
  @override
  final int uid;
  @override
  final String? messageId;
  @override
  final String? subject;
  @override
  final EmailAddress? from;
  final List<EmailAddress> _to;
  @override
  @JsonKey()
  List<EmailAddress> get to {
    if (_to is EqualUnmodifiableListView) return _to;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_to);
  }

  final List<EmailAddress> _cc;
  @override
  @JsonKey()
  List<EmailAddress> get cc {
    if (_cc is EqualUnmodifiableListView) return _cc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cc);
  }

  final List<EmailAddress> _bcc;
  @override
  @JsonKey()
  List<EmailAddress> get bcc {
    if (_bcc is EqualUnmodifiableListView) return _bcc;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bcc);
  }

  @override
  final EmailAddress? replyTo;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
  final bool isFlagged;
  @override
  @JsonKey()
  final bool isAnswered;
  @override
  @JsonKey()
  final bool isForwarded;
  @override
  @JsonKey()
  final bool hasAttachments;
  @override
  final String? previewText;
  @override
  final String? bodyHtml;
  @override
  final String? bodyText;
  @override
  @JsonKey()
  final int size;
  final List<MessageFlag> _flags;
  @override
  @JsonKey()
  List<MessageFlag> get flags {
    if (_flags is EqualUnmodifiableListView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flags);
  }

  @override
  final String? inReplyTo;
  final List<String> _references;
  @override
  @JsonKey()
  List<String> get references {
    if (_references is EqualUnmodifiableListView) return _references;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_references);
  }

  final List<Attachment> _attachments;
  @override
  @JsonKey()
  List<Attachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  @JsonKey()
  final SyncStatus syncStatus;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Message(id: $id, accountId: $accountId, folderId: $folderId, uid: $uid, messageId: $messageId, subject: $subject, from: $from, to: $to, cc: $cc, bcc: $bcc, replyTo: $replyTo, date: $date, isRead: $isRead, isFlagged: $isFlagged, isAnswered: $isAnswered, isForwarded: $isForwarded, hasAttachments: $hasAttachments, previewText: $previewText, bodyHtml: $bodyHtml, bodyText: $bodyText, size: $size, flags: $flags, inReplyTo: $inReplyTo, references: $references, attachments: $attachments, syncStatus: $syncStatus, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.from, from) || other.from == from) &&
            const DeepCollectionEquality().equals(other._to, _to) &&
            const DeepCollectionEquality().equals(other._cc, _cc) &&
            const DeepCollectionEquality().equals(other._bcc, _bcc) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged) &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered) &&
            (identical(other.isForwarded, isForwarded) ||
                other.isForwarded == isForwarded) &&
            (identical(other.hasAttachments, hasAttachments) ||
                other.hasAttachments == hasAttachments) &&
            (identical(other.previewText, previewText) ||
                other.previewText == previewText) &&
            (identical(other.bodyHtml, bodyHtml) ||
                other.bodyHtml == bodyHtml) &&
            (identical(other.bodyText, bodyText) ||
                other.bodyText == bodyText) &&
            (identical(other.size, size) || other.size == size) &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            (identical(other.inReplyTo, inReplyTo) ||
                other.inReplyTo == inReplyTo) &&
            const DeepCollectionEquality()
                .equals(other._references, _references) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        accountId,
        folderId,
        uid,
        messageId,
        subject,
        from,
        const DeepCollectionEquality().hash(_to),
        const DeepCollectionEquality().hash(_cc),
        const DeepCollectionEquality().hash(_bcc),
        replyTo,
        date,
        isRead,
        isFlagged,
        isAnswered,
        isForwarded,
        hasAttachments,
        previewText,
        bodyHtml,
        bodyText,
        size,
        const DeepCollectionEquality().hash(_flags),
        inReplyTo,
        const DeepCollectionEquality().hash(_references),
        const DeepCollectionEquality().hash(_attachments),
        syncStatus,
        createdAt
      ]);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  const factory _Message(
      {required final String id,
      required final String accountId,
      required final String folderId,
      required final int uid,
      final String? messageId,
      final String? subject,
      final EmailAddress? from,
      final List<EmailAddress> to,
      final List<EmailAddress> cc,
      final List<EmailAddress> bcc,
      final EmailAddress? replyTo,
      required final DateTime date,
      final bool isRead,
      final bool isFlagged,
      final bool isAnswered,
      final bool isForwarded,
      final bool hasAttachments,
      final String? previewText,
      final String? bodyHtml,
      final String? bodyText,
      final int size,
      final List<MessageFlag> flags,
      final String? inReplyTo,
      final List<String> references,
      final List<Attachment> attachments,
      final SyncStatus syncStatus,
      required final DateTime createdAt}) = _$MessageImpl;
  const _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get id;
  @override
  String get accountId;
  @override
  String get folderId;
  @override
  int get uid;
  @override
  String? get messageId;
  @override
  String? get subject;
  @override
  EmailAddress? get from;
  @override
  List<EmailAddress> get to;
  @override
  List<EmailAddress> get cc;
  @override
  List<EmailAddress> get bcc;
  @override
  EmailAddress? get replyTo;
  @override
  DateTime get date;
  @override
  bool get isRead;
  @override
  bool get isFlagged;
  @override
  bool get isAnswered;
  @override
  bool get isForwarded;
  @override
  bool get hasAttachments;
  @override
  String? get previewText;
  @override
  String? get bodyHtml;
  @override
  String? get bodyText;
  @override
  int get size;
  @override
  List<MessageFlag> get flags;
  @override
  String? get inReplyTo;
  @override
  List<String> get references;
  @override
  List<Attachment> get attachments;
  @override
  SyncStatus get syncStatus;
  @override
  DateTime get createdAt;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmailAddress _$EmailAddressFromJson(Map<String, dynamic> json) {
  return _EmailAddress.fromJson(json);
}

/// @nodoc
mixin _$EmailAddress {
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this EmailAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailAddressCopyWith<EmailAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailAddressCopyWith<$Res> {
  factory $EmailAddressCopyWith(
          EmailAddress value, $Res Function(EmailAddress) then) =
      _$EmailAddressCopyWithImpl<$Res, EmailAddress>;
  @useResult
  $Res call({String email, String? name});
}

/// @nodoc
class _$EmailAddressCopyWithImpl<$Res, $Val extends EmailAddress>
    implements $EmailAddressCopyWith<$Res> {
  _$EmailAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailAddressImplCopyWith<$Res>
    implements $EmailAddressCopyWith<$Res> {
  factory _$$EmailAddressImplCopyWith(
          _$EmailAddressImpl value, $Res Function(_$EmailAddressImpl) then) =
      __$$EmailAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String? name});
}

/// @nodoc
class __$$EmailAddressImplCopyWithImpl<$Res>
    extends _$EmailAddressCopyWithImpl<$Res, _$EmailAddressImpl>
    implements _$$EmailAddressImplCopyWith<$Res> {
  __$$EmailAddressImplCopyWithImpl(
      _$EmailAddressImpl _value, $Res Function(_$EmailAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = freezed,
  }) {
    return _then(_$EmailAddressImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailAddressImpl extends _EmailAddress {
  const _$EmailAddressImpl({required this.email, this.name}) : super._();

  factory _$EmailAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailAddressImplFromJson(json);

  @override
  final String email;
  @override
  final String? name;

  @override
  String toString() {
    return 'EmailAddress(email: $email, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAddressImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, name);

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAddressImplCopyWith<_$EmailAddressImpl> get copyWith =>
      __$$EmailAddressImplCopyWithImpl<_$EmailAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailAddressImplToJson(
      this,
    );
  }
}

abstract class _EmailAddress extends EmailAddress {
  const factory _EmailAddress(
      {required final String email, final String? name}) = _$EmailAddressImpl;
  const _EmailAddress._() : super._();

  factory _EmailAddress.fromJson(Map<String, dynamic> json) =
      _$EmailAddressImpl.fromJson;

  @override
  String get email;
  @override
  String? get name;

  /// Create a copy of EmailAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailAddressImplCopyWith<_$EmailAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
mixin _$Attachment {
  String get id => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String? get contentId => throw _privateConstructorUsedError;
  bool get isInline => throw _privateConstructorUsedError;
  String? get localPath => throw _privateConstructorUsedError;
  DownloadStatus get downloadStatus => throw _privateConstructorUsedError;
  double? get downloadProgress => throw _privateConstructorUsedError;

  /// Serializes this Attachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
          Attachment value, $Res Function(Attachment) then) =
      _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
  $Res call(
      {String id,
      String messageId,
      String? filename,
      String? mimeType,
      int size,
      String? contentId,
      bool isInline,
      String? localPath,
      DownloadStatus downloadStatus,
      double? downloadProgress});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageId = null,
    Object? filename = freezed,
    Object? mimeType = freezed,
    Object? size = null,
    Object? contentId = freezed,
    Object? isInline = null,
    Object? localPath = freezed,
    Object? downloadStatus = null,
    Object? downloadProgress = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isInline: null == isInline
          ? _value.isInline
          : isInline // ignore: cast_nullable_to_non_nullable
              as bool,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadStatus: null == downloadStatus
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      downloadProgress: freezed == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttachmentImplCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$AttachmentImplCopyWith(
          _$AttachmentImpl value, $Res Function(_$AttachmentImpl) then) =
      __$$AttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String messageId,
      String? filename,
      String? mimeType,
      int size,
      String? contentId,
      bool isInline,
      String? localPath,
      DownloadStatus downloadStatus,
      double? downloadProgress});
}

/// @nodoc
class __$$AttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$AttachmentImpl>
    implements _$$AttachmentImplCopyWith<$Res> {
  __$$AttachmentImplCopyWithImpl(
      _$AttachmentImpl _value, $Res Function(_$AttachmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageId = null,
    Object? filename = freezed,
    Object? mimeType = freezed,
    Object? size = null,
    Object? contentId = freezed,
    Object? isInline = null,
    Object? localPath = freezed,
    Object? downloadStatus = null,
    Object? downloadProgress = freezed,
  }) {
    return _then(_$AttachmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      contentId: freezed == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String?,
      isInline: null == isInline
          ? _value.isInline
          : isInline // ignore: cast_nullable_to_non_nullable
              as bool,
      localPath: freezed == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadStatus: null == downloadStatus
          ? _value.downloadStatus
          : downloadStatus // ignore: cast_nullable_to_non_nullable
              as DownloadStatus,
      downloadProgress: freezed == downloadProgress
          ? _value.downloadProgress
          : downloadProgress // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentImpl extends _Attachment {
  const _$AttachmentImpl(
      {required this.id,
      required this.messageId,
      this.filename,
      this.mimeType,
      this.size = 0,
      this.contentId,
      this.isInline = false,
      this.localPath,
      this.downloadStatus = DownloadStatus.notDownloaded,
      this.downloadProgress})
      : super._();

  factory _$AttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentImplFromJson(json);

  @override
  final String id;
  @override
  final String messageId;
  @override
  final String? filename;
  @override
  final String? mimeType;
  @override
  @JsonKey()
  final int size;
  @override
  final String? contentId;
  @override
  @JsonKey()
  final bool isInline;
  @override
  final String? localPath;
  @override
  @JsonKey()
  final DownloadStatus downloadStatus;
  @override
  final double? downloadProgress;

  @override
  String toString() {
    return 'Attachment(id: $id, messageId: $messageId, filename: $filename, mimeType: $mimeType, size: $size, contentId: $contentId, isInline: $isInline, localPath: $localPath, downloadStatus: $downloadStatus, downloadProgress: $downloadProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.isInline, isInline) ||
                other.isInline == isInline) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.downloadStatus, downloadStatus) ||
                other.downloadStatus == downloadStatus) &&
            (identical(other.downloadProgress, downloadProgress) ||
                other.downloadProgress == downloadProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      messageId,
      filename,
      mimeType,
      size,
      contentId,
      isInline,
      localPath,
      downloadStatus,
      downloadProgress);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      __$$AttachmentImplCopyWithImpl<_$AttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentImplToJson(
      this,
    );
  }
}

abstract class _Attachment extends Attachment {
  const factory _Attachment(
      {required final String id,
      required final String messageId,
      final String? filename,
      final String? mimeType,
      final int size,
      final String? contentId,
      final bool isInline,
      final String? localPath,
      final DownloadStatus downloadStatus,
      final double? downloadProgress}) = _$AttachmentImpl;
  const _Attachment._() : super._();

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$AttachmentImpl.fromJson;

  @override
  String get id;
  @override
  String get messageId;
  @override
  String? get filename;
  @override
  String? get mimeType;
  @override
  int get size;
  @override
  String? get contentId;
  @override
  bool get isInline;
  @override
  String? get localPath;
  @override
  DownloadStatus get downloadStatus;
  @override
  double? get downloadProgress;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  DateTime? get lastContactAt => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      String source,
      int frequency,
      DateTime? lastContactAt,
      String? avatarUrl});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? source = null,
    Object? frequency = null,
    Object? lastContactAt = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      lastContactAt: freezed == lastContactAt
          ? _value.lastContactAt
          : lastContactAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String? name,
      String source,
      int frequency,
      DateTime? lastContactAt,
      String? avatarUrl});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = freezed,
    Object? source = null,
    Object? frequency = null,
    Object? lastContactAt = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$ContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      lastContactAt: freezed == lastContactAt
          ? _value.lastContactAt
          : lastContactAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl implements _Contact {
  const _$ContactImpl(
      {required this.id,
      required this.email,
      this.name,
      this.source = 'auto',
      this.frequency = 1,
      this.lastContactAt,
      this.avatarUrl});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  @override
  @JsonKey()
  final String source;
  @override
  @JsonKey()
  final int frequency;
  @override
  final DateTime? lastContactAt;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'Contact(id: $id, email: $email, name: $name, source: $source, frequency: $frequency, lastContactAt: $lastContactAt, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.lastContactAt, lastContactAt) ||
                other.lastContactAt == lastContactAt) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, source,
      frequency, lastContactAt, avatarUrl);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {required final String id,
      required final String email,
      final String? name,
      final String source,
      final int frequency,
      final DateTime? lastContactAt,
      final String? avatarUrl}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get name;
  @override
  String get source;
  @override
  int get frequency;
  @override
  DateTime? get lastContactAt;
  @override
  String? get avatarUrl;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OutboxMessage _$OutboxMessageFromJson(Map<String, dynamic> json) {
  return _OutboxMessage.fromJson(json);
}

/// @nodoc
mixin _$OutboxMessage {
  String get id => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  String get rawMime => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  List<EmailAddress> get to => throw _privateConstructorUsedError;
  List<EmailAddress> get cc => throw _privateConstructorUsedError;
  List<EmailAddress> get bcc => throw _privateConstructorUsedError;
  SendStatus get status => throw _privateConstructorUsedError;
  int get retryCount => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get sentAt => throw _privateConstructorUsedError;

  /// Serializes this OutboxMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutboxMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutboxMessageCopyWith<OutboxMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutboxMessageCopyWith<$Res> {
  factory $OutboxMessageCopyWith(
          OutboxMessage value, $Res Function(OutboxMessage) then) =
      _$OutboxMessageCopyWithImpl<$Res, OutboxMessage>;
  @useResult
  $Res call(
      {String id,
      String accountId,
      String rawMime,
      String? subject,
      List<EmailAddress> to,
      List<EmailAddress> cc,
      List<EmailAddress> bcc,
      SendStatus status,
      int retryCount,
      String? errorMessage,
      DateTime createdAt,
      DateTime? sentAt});
}

/// @nodoc
class _$OutboxMessageCopyWithImpl<$Res, $Val extends OutboxMessage>
    implements $OutboxMessageCopyWith<$Res> {
  _$OutboxMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutboxMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? rawMime = null,
    Object? subject = freezed,
    Object? to = null,
    Object? cc = null,
    Object? bcc = null,
    Object? status = null,
    Object? retryCount = null,
    Object? errorMessage = freezed,
    Object? createdAt = null,
    Object? sentAt = freezed,
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
      rawMime: null == rawMime
          ? _value.rawMime
          : rawMime // ignore: cast_nullable_to_non_nullable
              as String,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SendStatus,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutboxMessageImplCopyWith<$Res>
    implements $OutboxMessageCopyWith<$Res> {
  factory _$$OutboxMessageImplCopyWith(
          _$OutboxMessageImpl value, $Res Function(_$OutboxMessageImpl) then) =
      __$$OutboxMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String accountId,
      String rawMime,
      String? subject,
      List<EmailAddress> to,
      List<EmailAddress> cc,
      List<EmailAddress> bcc,
      SendStatus status,
      int retryCount,
      String? errorMessage,
      DateTime createdAt,
      DateTime? sentAt});
}

/// @nodoc
class __$$OutboxMessageImplCopyWithImpl<$Res>
    extends _$OutboxMessageCopyWithImpl<$Res, _$OutboxMessageImpl>
    implements _$$OutboxMessageImplCopyWith<$Res> {
  __$$OutboxMessageImplCopyWithImpl(
      _$OutboxMessageImpl _value, $Res Function(_$OutboxMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? rawMime = null,
    Object? subject = freezed,
    Object? to = null,
    Object? cc = null,
    Object? bcc = null,
    Object? status = null,
    Object? retryCount = null,
    Object? errorMessage = freezed,
    Object? createdAt = null,
    Object? sentAt = freezed,
  }) {
    return _then(_$OutboxMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      rawMime: null == rawMime
          ? _value.rawMime
          : rawMime // ignore: cast_nullable_to_non_nullable
              as String,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SendStatus,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutboxMessageImpl implements _OutboxMessage {
  const _$OutboxMessageImpl(
      {required this.id,
      required this.accountId,
      required this.rawMime,
      this.subject,
      final List<EmailAddress> to = const <EmailAddress>[],
      final List<EmailAddress> cc = const <EmailAddress>[],
      final List<EmailAddress> bcc = const <EmailAddress>[],
      this.status = SendStatus.queued,
      this.retryCount = 0,
      this.errorMessage,
      required this.createdAt,
      this.sentAt})
      : _to = to,
        _cc = cc,
        _bcc = bcc;

  factory _$OutboxMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutboxMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String accountId;
  @override
  final String rawMime;
  @override
  final String? subject;
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
  @JsonKey()
  final SendStatus status;
  @override
  @JsonKey()
  final int retryCount;
  @override
  final String? errorMessage;
  @override
  final DateTime createdAt;
  @override
  final DateTime? sentAt;

  @override
  String toString() {
    return 'OutboxMessage(id: $id, accountId: $accountId, rawMime: $rawMime, subject: $subject, to: $to, cc: $cc, bcc: $bcc, status: $status, retryCount: $retryCount, errorMessage: $errorMessage, createdAt: $createdAt, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutboxMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.rawMime, rawMime) || other.rawMime == rawMime) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality().equals(other._to, _to) &&
            const DeepCollectionEquality().equals(other._cc, _cc) &&
            const DeepCollectionEquality().equals(other._bcc, _bcc) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      accountId,
      rawMime,
      subject,
      const DeepCollectionEquality().hash(_to),
      const DeepCollectionEquality().hash(_cc),
      const DeepCollectionEquality().hash(_bcc),
      status,
      retryCount,
      errorMessage,
      createdAt,
      sentAt);

  /// Create a copy of OutboxMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutboxMessageImplCopyWith<_$OutboxMessageImpl> get copyWith =>
      __$$OutboxMessageImplCopyWithImpl<_$OutboxMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutboxMessageImplToJson(
      this,
    );
  }
}

abstract class _OutboxMessage implements OutboxMessage {
  const factory _OutboxMessage(
      {required final String id,
      required final String accountId,
      required final String rawMime,
      final String? subject,
      final List<EmailAddress> to,
      final List<EmailAddress> cc,
      final List<EmailAddress> bcc,
      final SendStatus status,
      final int retryCount,
      final String? errorMessage,
      required final DateTime createdAt,
      final DateTime? sentAt}) = _$OutboxMessageImpl;

  factory _OutboxMessage.fromJson(Map<String, dynamic> json) =
      _$OutboxMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get accountId;
  @override
  String get rawMime;
  @override
  String? get subject;
  @override
  List<EmailAddress> get to;
  @override
  List<EmailAddress> get cc;
  @override
  List<EmailAddress> get bcc;
  @override
  SendStatus get status;
  @override
  int get retryCount;
  @override
  String? get errorMessage;
  @override
  DateTime get createdAt;
  @override
  DateTime? get sentAt;

  /// Create a copy of OutboxMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutboxMessageImplCopyWith<_$OutboxMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServerConfig _$ServerConfigFromJson(Map<String, dynamic> json) {
  return _ServerConfig.fromJson(json);
}

/// @nodoc
mixin _$ServerConfig {
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  bool get ssl => throw _privateConstructorUsedError;
  bool get startTls => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  /// Serializes this ServerConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServerConfigCopyWith<ServerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerConfigCopyWith<$Res> {
  factory $ServerConfigCopyWith(
          ServerConfig value, $Res Function(ServerConfig) then) =
      _$ServerConfigCopyWithImpl<$Res, ServerConfig>;
  @useResult
  $Res call({String host, int port, bool ssl, bool startTls, String? username});
}

/// @nodoc
class _$ServerConfigCopyWithImpl<$Res, $Val extends ServerConfig>
    implements $ServerConfigCopyWith<$Res> {
  _$ServerConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? ssl = null,
    Object? startTls = null,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      ssl: null == ssl
          ? _value.ssl
          : ssl // ignore: cast_nullable_to_non_nullable
              as bool,
      startTls: null == startTls
          ? _value.startTls
          : startTls // ignore: cast_nullable_to_non_nullable
              as bool,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerConfigImplCopyWith<$Res>
    implements $ServerConfigCopyWith<$Res> {
  factory _$$ServerConfigImplCopyWith(
          _$ServerConfigImpl value, $Res Function(_$ServerConfigImpl) then) =
      __$$ServerConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host, int port, bool ssl, bool startTls, String? username});
}

/// @nodoc
class __$$ServerConfigImplCopyWithImpl<$Res>
    extends _$ServerConfigCopyWithImpl<$Res, _$ServerConfigImpl>
    implements _$$ServerConfigImplCopyWith<$Res> {
  __$$ServerConfigImplCopyWithImpl(
      _$ServerConfigImpl _value, $Res Function(_$ServerConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? ssl = null,
    Object? startTls = null,
    Object? username = freezed,
  }) {
    return _then(_$ServerConfigImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      ssl: null == ssl
          ? _value.ssl
          : ssl // ignore: cast_nullable_to_non_nullable
              as bool,
      startTls: null == startTls
          ? _value.startTls
          : startTls // ignore: cast_nullable_to_non_nullable
              as bool,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerConfigImpl implements _ServerConfig {
  const _$ServerConfigImpl(
      {required this.host,
      required this.port,
      this.ssl = true,
      this.startTls = false,
      this.username});

  factory _$ServerConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerConfigImplFromJson(json);

  @override
  final String host;
  @override
  final int port;
  @override
  @JsonKey()
  final bool ssl;
  @override
  @JsonKey()
  final bool startTls;
  @override
  final String? username;

  @override
  String toString() {
    return 'ServerConfig(host: $host, port: $port, ssl: $ssl, startTls: $startTls, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerConfigImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.ssl, ssl) || other.ssl == ssl) &&
            (identical(other.startTls, startTls) ||
                other.startTls == startTls) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, host, port, ssl, startTls, username);

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerConfigImplCopyWith<_$ServerConfigImpl> get copyWith =>
      __$$ServerConfigImplCopyWithImpl<_$ServerConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerConfigImplToJson(
      this,
    );
  }
}

abstract class _ServerConfig implements ServerConfig {
  const factory _ServerConfig(
      {required final String host,
      required final int port,
      final bool ssl,
      final bool startTls,
      final String? username}) = _$ServerConfigImpl;

  factory _ServerConfig.fromJson(Map<String, dynamic> json) =
      _$ServerConfigImpl.fromJson;

  @override
  String get host;
  @override
  int get port;
  @override
  bool get ssl;
  @override
  bool get startTls;
  @override
  String? get username;

  /// Create a copy of ServerConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerConfigImplCopyWith<_$ServerConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AutoConfig _$AutoConfigFromJson(Map<String, dynamic> json) {
  return _AutoConfig.fromJson(json);
}

/// @nodoc
mixin _$AutoConfig {
  String get domain => throw _privateConstructorUsedError;
  ServerConfig? get imap => throw _privateConstructorUsedError;
  ServerConfig? get smtp => throw _privateConstructorUsedError;
  ServerConfig? get pop3 => throw _privateConstructorUsedError;
  MailProvider? get provider => throw _privateConstructorUsedError;

  /// Serializes this AutoConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutoConfigCopyWith<AutoConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoConfigCopyWith<$Res> {
  factory $AutoConfigCopyWith(
          AutoConfig value, $Res Function(AutoConfig) then) =
      _$AutoConfigCopyWithImpl<$Res, AutoConfig>;
  @useResult
  $Res call(
      {String domain,
      ServerConfig? imap,
      ServerConfig? smtp,
      ServerConfig? pop3,
      MailProvider? provider});

  $ServerConfigCopyWith<$Res>? get imap;
  $ServerConfigCopyWith<$Res>? get smtp;
  $ServerConfigCopyWith<$Res>? get pop3;
}

/// @nodoc
class _$AutoConfigCopyWithImpl<$Res, $Val extends AutoConfig>
    implements $AutoConfigCopyWith<$Res> {
  _$AutoConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
    Object? imap = freezed,
    Object? smtp = freezed,
    Object? pop3 = freezed,
    Object? provider = freezed,
  }) {
    return _then(_value.copyWith(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      imap: freezed == imap
          ? _value.imap
          : imap // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      smtp: freezed == smtp
          ? _value.smtp
          : smtp // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      pop3: freezed == pop3
          ? _value.pop3
          : pop3 // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as MailProvider?,
    ) as $Val);
  }

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerConfigCopyWith<$Res>? get imap {
    if (_value.imap == null) {
      return null;
    }

    return $ServerConfigCopyWith<$Res>(_value.imap!, (value) {
      return _then(_value.copyWith(imap: value) as $Val);
    });
  }

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerConfigCopyWith<$Res>? get smtp {
    if (_value.smtp == null) {
      return null;
    }

    return $ServerConfigCopyWith<$Res>(_value.smtp!, (value) {
      return _then(_value.copyWith(smtp: value) as $Val);
    });
  }

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerConfigCopyWith<$Res>? get pop3 {
    if (_value.pop3 == null) {
      return null;
    }

    return $ServerConfigCopyWith<$Res>(_value.pop3!, (value) {
      return _then(_value.copyWith(pop3: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AutoConfigImplCopyWith<$Res>
    implements $AutoConfigCopyWith<$Res> {
  factory _$$AutoConfigImplCopyWith(
          _$AutoConfigImpl value, $Res Function(_$AutoConfigImpl) then) =
      __$$AutoConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String domain,
      ServerConfig? imap,
      ServerConfig? smtp,
      ServerConfig? pop3,
      MailProvider? provider});

  @override
  $ServerConfigCopyWith<$Res>? get imap;
  @override
  $ServerConfigCopyWith<$Res>? get smtp;
  @override
  $ServerConfigCopyWith<$Res>? get pop3;
}

/// @nodoc
class __$$AutoConfigImplCopyWithImpl<$Res>
    extends _$AutoConfigCopyWithImpl<$Res, _$AutoConfigImpl>
    implements _$$AutoConfigImplCopyWith<$Res> {
  __$$AutoConfigImplCopyWithImpl(
      _$AutoConfigImpl _value, $Res Function(_$AutoConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domain = null,
    Object? imap = freezed,
    Object? smtp = freezed,
    Object? pop3 = freezed,
    Object? provider = freezed,
  }) {
    return _then(_$AutoConfigImpl(
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      imap: freezed == imap
          ? _value.imap
          : imap // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      smtp: freezed == smtp
          ? _value.smtp
          : smtp // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      pop3: freezed == pop3
          ? _value.pop3
          : pop3 // ignore: cast_nullable_to_non_nullable
              as ServerConfig?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as MailProvider?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoConfigImpl implements _AutoConfig {
  const _$AutoConfigImpl(
      {required this.domain, this.imap, this.smtp, this.pop3, this.provider});

  factory _$AutoConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutoConfigImplFromJson(json);

  @override
  final String domain;
  @override
  final ServerConfig? imap;
  @override
  final ServerConfig? smtp;
  @override
  final ServerConfig? pop3;
  @override
  final MailProvider? provider;

  @override
  String toString() {
    return 'AutoConfig(domain: $domain, imap: $imap, smtp: $smtp, pop3: $pop3, provider: $provider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoConfigImpl &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.imap, imap) || other.imap == imap) &&
            (identical(other.smtp, smtp) || other.smtp == smtp) &&
            (identical(other.pop3, pop3) || other.pop3 == pop3) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, domain, imap, smtp, pop3, provider);

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoConfigImplCopyWith<_$AutoConfigImpl> get copyWith =>
      __$$AutoConfigImplCopyWithImpl<_$AutoConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoConfigImplToJson(
      this,
    );
  }
}

abstract class _AutoConfig implements AutoConfig {
  const factory _AutoConfig(
      {required final String domain,
      final ServerConfig? imap,
      final ServerConfig? smtp,
      final ServerConfig? pop3,
      final MailProvider? provider}) = _$AutoConfigImpl;

  factory _AutoConfig.fromJson(Map<String, dynamic> json) =
      _$AutoConfigImpl.fromJson;

  @override
  String get domain;
  @override
  ServerConfig? get imap;
  @override
  ServerConfig? get smtp;
  @override
  ServerConfig? get pop3;
  @override
  MailProvider? get provider;

  /// Create a copy of AutoConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoConfigImplCopyWith<_$AutoConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

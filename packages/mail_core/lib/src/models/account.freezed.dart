// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  MailProvider get provider => throw _privateConstructorUsedError;
  MailProtocol get protocol => throw _privateConstructorUsedError;
  AuthMethod get authMethod =>
      throw _privateConstructorUsedError; // IMAP settings
  String? get imapHost => throw _privateConstructorUsedError;
  int get imapPort => throw _privateConstructorUsedError;
  bool get imapSsl => throw _privateConstructorUsedError; // SMTP settings
  String? get smtpHost => throw _privateConstructorUsedError;
  int get smtpPort => throw _privateConstructorUsedError;
  bool get smtpSsl => throw _privateConstructorUsedError;
  bool get smtpStartTls => throw _privateConstructorUsedError; // POP3 settings
  String? get pop3Host => throw _privateConstructorUsedError;
  int get pop3Port => throw _privateConstructorUsedError;
  bool get pop3Ssl => throw _privateConstructorUsedError; // OAuth2
  String? get oauthProvider => throw _privateConstructorUsedError;
  String? get refreshToken =>
      throw _privateConstructorUsedError; // Sync settings
  int get syncIntervalMinutes => throw _privateConstructorUsedError;
  int get syncDaysBack => throw _privateConstructorUsedError; // Status
  bool get isActive => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {String id,
      String email,
      String displayName,
      MailProvider provider,
      MailProtocol protocol,
      AuthMethod authMethod,
      String? imapHost,
      int imapPort,
      bool imapSsl,
      String? smtpHost,
      int smtpPort,
      bool smtpSsl,
      bool smtpStartTls,
      String? pop3Host,
      int pop3Port,
      bool pop3Ssl,
      String? oauthProvider,
      String? refreshToken,
      int syncIntervalMinutes,
      int syncDaysBack,
      bool isActive,
      bool isDefault,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? provider = null,
    Object? protocol = null,
    Object? authMethod = null,
    Object? imapHost = freezed,
    Object? imapPort = null,
    Object? imapSsl = null,
    Object? smtpHost = freezed,
    Object? smtpPort = null,
    Object? smtpSsl = null,
    Object? smtpStartTls = null,
    Object? pop3Host = freezed,
    Object? pop3Port = null,
    Object? pop3Ssl = null,
    Object? oauthProvider = freezed,
    Object? refreshToken = freezed,
    Object? syncIntervalMinutes = null,
    Object? syncDaysBack = null,
    Object? isActive = null,
    Object? isDefault = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as MailProvider,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as MailProtocol,
      authMethod: null == authMethod
          ? _value.authMethod
          : authMethod // ignore: cast_nullable_to_non_nullable
              as AuthMethod,
      imapHost: freezed == imapHost
          ? _value.imapHost
          : imapHost // ignore: cast_nullable_to_non_nullable
              as String?,
      imapPort: null == imapPort
          ? _value.imapPort
          : imapPort // ignore: cast_nullable_to_non_nullable
              as int,
      imapSsl: null == imapSsl
          ? _value.imapSsl
          : imapSsl // ignore: cast_nullable_to_non_nullable
              as bool,
      smtpHost: freezed == smtpHost
          ? _value.smtpHost
          : smtpHost // ignore: cast_nullable_to_non_nullable
              as String?,
      smtpPort: null == smtpPort
          ? _value.smtpPort
          : smtpPort // ignore: cast_nullable_to_non_nullable
              as int,
      smtpSsl: null == smtpSsl
          ? _value.smtpSsl
          : smtpSsl // ignore: cast_nullable_to_non_nullable
              as bool,
      smtpStartTls: null == smtpStartTls
          ? _value.smtpStartTls
          : smtpStartTls // ignore: cast_nullable_to_non_nullable
              as bool,
      pop3Host: freezed == pop3Host
          ? _value.pop3Host
          : pop3Host // ignore: cast_nullable_to_non_nullable
              as String?,
      pop3Port: null == pop3Port
          ? _value.pop3Port
          : pop3Port // ignore: cast_nullable_to_non_nullable
              as int,
      pop3Ssl: null == pop3Ssl
          ? _value.pop3Ssl
          : pop3Ssl // ignore: cast_nullable_to_non_nullable
              as bool,
      oauthProvider: freezed == oauthProvider
          ? _value.oauthProvider
          : oauthProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      syncDaysBack: null == syncDaysBack
          ? _value.syncDaysBack
          : syncDaysBack // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String displayName,
      MailProvider provider,
      MailProtocol protocol,
      AuthMethod authMethod,
      String? imapHost,
      int imapPort,
      bool imapSsl,
      String? smtpHost,
      int smtpPort,
      bool smtpSsl,
      bool smtpStartTls,
      String? pop3Host,
      int pop3Port,
      bool pop3Ssl,
      String? oauthProvider,
      String? refreshToken,
      int syncIntervalMinutes,
      int syncDaysBack,
      bool isActive,
      bool isDefault,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? provider = null,
    Object? protocol = null,
    Object? authMethod = null,
    Object? imapHost = freezed,
    Object? imapPort = null,
    Object? imapSsl = null,
    Object? smtpHost = freezed,
    Object? smtpPort = null,
    Object? smtpSsl = null,
    Object? smtpStartTls = null,
    Object? pop3Host = freezed,
    Object? pop3Port = null,
    Object? pop3Ssl = null,
    Object? oauthProvider = freezed,
    Object? refreshToken = freezed,
    Object? syncIntervalMinutes = null,
    Object? syncDaysBack = null,
    Object? isActive = null,
    Object? isDefault = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as MailProvider,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as MailProtocol,
      authMethod: null == authMethod
          ? _value.authMethod
          : authMethod // ignore: cast_nullable_to_non_nullable
              as AuthMethod,
      imapHost: freezed == imapHost
          ? _value.imapHost
          : imapHost // ignore: cast_nullable_to_non_nullable
              as String?,
      imapPort: null == imapPort
          ? _value.imapPort
          : imapPort // ignore: cast_nullable_to_non_nullable
              as int,
      imapSsl: null == imapSsl
          ? _value.imapSsl
          : imapSsl // ignore: cast_nullable_to_non_nullable
              as bool,
      smtpHost: freezed == smtpHost
          ? _value.smtpHost
          : smtpHost // ignore: cast_nullable_to_non_nullable
              as String?,
      smtpPort: null == smtpPort
          ? _value.smtpPort
          : smtpPort // ignore: cast_nullable_to_non_nullable
              as int,
      smtpSsl: null == smtpSsl
          ? _value.smtpSsl
          : smtpSsl // ignore: cast_nullable_to_non_nullable
              as bool,
      smtpStartTls: null == smtpStartTls
          ? _value.smtpStartTls
          : smtpStartTls // ignore: cast_nullable_to_non_nullable
              as bool,
      pop3Host: freezed == pop3Host
          ? _value.pop3Host
          : pop3Host // ignore: cast_nullable_to_non_nullable
              as String?,
      pop3Port: null == pop3Port
          ? _value.pop3Port
          : pop3Port // ignore: cast_nullable_to_non_nullable
              as int,
      pop3Ssl: null == pop3Ssl
          ? _value.pop3Ssl
          : pop3Ssl // ignore: cast_nullable_to_non_nullable
              as bool,
      oauthProvider: freezed == oauthProvider
          ? _value.oauthProvider
          : oauthProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      syncIntervalMinutes: null == syncIntervalMinutes
          ? _value.syncIntervalMinutes
          : syncIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      syncDaysBack: null == syncDaysBack
          ? _value.syncDaysBack
          : syncDaysBack // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  const _$AccountImpl(
      {required this.id,
      required this.email,
      this.displayName = '',
      required this.provider,
      required this.protocol,
      required this.authMethod,
      this.imapHost,
      this.imapPort = 993,
      this.imapSsl = true,
      this.smtpHost,
      this.smtpPort = 587,
      this.smtpSsl = false,
      this.smtpStartTls = true,
      this.pop3Host,
      this.pop3Port = 995,
      this.pop3Ssl = true,
      this.oauthProvider,
      this.refreshToken,
      this.syncIntervalMinutes = 15,
      this.syncDaysBack = 30,
      this.isActive = true,
      this.isDefault = false,
      required this.createdAt,
      required this.updatedAt});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey()
  final String displayName;
  @override
  final MailProvider provider;
  @override
  final MailProtocol protocol;
  @override
  final AuthMethod authMethod;
// IMAP settings
  @override
  final String? imapHost;
  @override
  @JsonKey()
  final int imapPort;
  @override
  @JsonKey()
  final bool imapSsl;
// SMTP settings
  @override
  final String? smtpHost;
  @override
  @JsonKey()
  final int smtpPort;
  @override
  @JsonKey()
  final bool smtpSsl;
  @override
  @JsonKey()
  final bool smtpStartTls;
// POP3 settings
  @override
  final String? pop3Host;
  @override
  @JsonKey()
  final int pop3Port;
  @override
  @JsonKey()
  final bool pop3Ssl;
// OAuth2
  @override
  final String? oauthProvider;
  @override
  final String? refreshToken;
// Sync settings
  @override
  @JsonKey()
  final int syncIntervalMinutes;
  @override
  @JsonKey()
  final int syncDaysBack;
// Status
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Account(id: $id, email: $email, displayName: $displayName, provider: $provider, protocol: $protocol, authMethod: $authMethod, imapHost: $imapHost, imapPort: $imapPort, imapSsl: $imapSsl, smtpHost: $smtpHost, smtpPort: $smtpPort, smtpSsl: $smtpSsl, smtpStartTls: $smtpStartTls, pop3Host: $pop3Host, pop3Port: $pop3Port, pop3Ssl: $pop3Ssl, oauthProvider: $oauthProvider, refreshToken: $refreshToken, syncIntervalMinutes: $syncIntervalMinutes, syncDaysBack: $syncDaysBack, isActive: $isActive, isDefault: $isDefault, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.authMethod, authMethod) ||
                other.authMethod == authMethod) &&
            (identical(other.imapHost, imapHost) ||
                other.imapHost == imapHost) &&
            (identical(other.imapPort, imapPort) ||
                other.imapPort == imapPort) &&
            (identical(other.imapSsl, imapSsl) || other.imapSsl == imapSsl) &&
            (identical(other.smtpHost, smtpHost) ||
                other.smtpHost == smtpHost) &&
            (identical(other.smtpPort, smtpPort) ||
                other.smtpPort == smtpPort) &&
            (identical(other.smtpSsl, smtpSsl) || other.smtpSsl == smtpSsl) &&
            (identical(other.smtpStartTls, smtpStartTls) ||
                other.smtpStartTls == smtpStartTls) &&
            (identical(other.pop3Host, pop3Host) ||
                other.pop3Host == pop3Host) &&
            (identical(other.pop3Port, pop3Port) ||
                other.pop3Port == pop3Port) &&
            (identical(other.pop3Ssl, pop3Ssl) || other.pop3Ssl == pop3Ssl) &&
            (identical(other.oauthProvider, oauthProvider) ||
                other.oauthProvider == oauthProvider) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.syncIntervalMinutes, syncIntervalMinutes) ||
                other.syncIntervalMinutes == syncIntervalMinutes) &&
            (identical(other.syncDaysBack, syncDaysBack) ||
                other.syncDaysBack == syncDaysBack) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        email,
        displayName,
        provider,
        protocol,
        authMethod,
        imapHost,
        imapPort,
        imapSsl,
        smtpHost,
        smtpPort,
        smtpSsl,
        smtpStartTls,
        pop3Host,
        pop3Port,
        pop3Ssl,
        oauthProvider,
        refreshToken,
        syncIntervalMinutes,
        syncDaysBack,
        isActive,
        isDefault,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {required final String id,
      required final String email,
      final String displayName,
      required final MailProvider provider,
      required final MailProtocol protocol,
      required final AuthMethod authMethod,
      final String? imapHost,
      final int imapPort,
      final bool imapSsl,
      final String? smtpHost,
      final int smtpPort,
      final bool smtpSsl,
      final bool smtpStartTls,
      final String? pop3Host,
      final int pop3Port,
      final bool pop3Ssl,
      final String? oauthProvider,
      final String? refreshToken,
      final int syncIntervalMinutes,
      final int syncDaysBack,
      final bool isActive,
      final bool isDefault,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get displayName;
  @override
  MailProvider get provider;
  @override
  MailProtocol get protocol;
  @override
  AuthMethod get authMethod; // IMAP settings
  @override
  String? get imapHost;
  @override
  int get imapPort;
  @override
  bool get imapSsl; // SMTP settings
  @override
  String? get smtpHost;
  @override
  int get smtpPort;
  @override
  bool get smtpSsl;
  @override
  bool get smtpStartTls; // POP3 settings
  @override
  String? get pop3Host;
  @override
  int get pop3Port;
  @override
  bool get pop3Ssl; // OAuth2
  @override
  String? get oauthProvider;
  @override
  String? get refreshToken; // Sync settings
  @override
  int get syncIntervalMinutes;
  @override
  int get syncDaysBack; // Status
  @override
  bool get isActive;
  @override
  bool get isDefault;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountStatus _$AccountStatusFromJson(Map<String, dynamic> json) {
  return _AccountStatus.fromJson(json);
}

/// @nodoc
mixin _$AccountStatus {
  String get accountId => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;
  bool get isSyncing => throw _privateConstructorUsedError;
  String? get lastError => throw _privateConstructorUsedError;
  DateTime? get lastSyncAt => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;

  /// Serializes this AccountStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountStatusCopyWith<AccountStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStatusCopyWith<$Res> {
  factory $AccountStatusCopyWith(
          AccountStatus value, $Res Function(AccountStatus) then) =
      _$AccountStatusCopyWithImpl<$Res, AccountStatus>;
  @useResult
  $Res call(
      {String accountId,
      bool isConnected,
      bool isSyncing,
      String? lastError,
      DateTime? lastSyncAt,
      int unreadCount});
}

/// @nodoc
class _$AccountStatusCopyWithImpl<$Res, $Val extends AccountStatus>
    implements $AccountStatusCopyWith<$Res> {
  _$AccountStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? isConnected = null,
    Object? isSyncing = null,
    Object? lastError = freezed,
    Object? lastSyncAt = freezed,
    Object? unreadCount = null,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSyncing: null == isSyncing
          ? _value.isSyncing
          : isSyncing // ignore: cast_nullable_to_non_nullable
              as bool,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountStatusImplCopyWith<$Res>
    implements $AccountStatusCopyWith<$Res> {
  factory _$$AccountStatusImplCopyWith(
          _$AccountStatusImpl value, $Res Function(_$AccountStatusImpl) then) =
      __$$AccountStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      bool isConnected,
      bool isSyncing,
      String? lastError,
      DateTime? lastSyncAt,
      int unreadCount});
}

/// @nodoc
class __$$AccountStatusImplCopyWithImpl<$Res>
    extends _$AccountStatusCopyWithImpl<$Res, _$AccountStatusImpl>
    implements _$$AccountStatusImplCopyWith<$Res> {
  __$$AccountStatusImplCopyWithImpl(
      _$AccountStatusImpl _value, $Res Function(_$AccountStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? isConnected = null,
    Object? isSyncing = null,
    Object? lastError = freezed,
    Object? lastSyncAt = freezed,
    Object? unreadCount = null,
  }) {
    return _then(_$AccountStatusImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isSyncing: null == isSyncing
          ? _value.isSyncing
          : isSyncing // ignore: cast_nullable_to_non_nullable
              as bool,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSyncAt: freezed == lastSyncAt
          ? _value.lastSyncAt
          : lastSyncAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountStatusImpl implements _AccountStatus {
  const _$AccountStatusImpl(
      {required this.accountId,
      this.isConnected = false,
      this.isSyncing = false,
      this.lastError,
      this.lastSyncAt,
      this.unreadCount = 0});

  factory _$AccountStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountStatusImplFromJson(json);

  @override
  final String accountId;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final bool isSyncing;
  @override
  final String? lastError;
  @override
  final DateTime? lastSyncAt;
  @override
  @JsonKey()
  final int unreadCount;

  @override
  String toString() {
    return 'AccountStatus(accountId: $accountId, isConnected: $isConnected, isSyncing: $isSyncing, lastError: $lastError, lastSyncAt: $lastSyncAt, unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStatusImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isSyncing, isSyncing) ||
                other.isSyncing == isSyncing) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError) &&
            (identical(other.lastSyncAt, lastSyncAt) ||
                other.lastSyncAt == lastSyncAt) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountId, isConnected,
      isSyncing, lastError, lastSyncAt, unreadCount);

  /// Create a copy of AccountStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStatusImplCopyWith<_$AccountStatusImpl> get copyWith =>
      __$$AccountStatusImplCopyWithImpl<_$AccountStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountStatusImplToJson(
      this,
    );
  }
}

abstract class _AccountStatus implements AccountStatus {
  const factory _AccountStatus(
      {required final String accountId,
      final bool isConnected,
      final bool isSyncing,
      final String? lastError,
      final DateTime? lastSyncAt,
      final int unreadCount}) = _$AccountStatusImpl;

  factory _AccountStatus.fromJson(Map<String, dynamic> json) =
      _$AccountStatusImpl.fromJson;

  @override
  String get accountId;
  @override
  bool get isConnected;
  @override
  bool get isSyncing;
  @override
  String? get lastError;
  @override
  DateTime? get lastSyncAt;
  @override
  int get unreadCount;

  /// Create a copy of AccountStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountStatusImplCopyWith<_$AccountStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

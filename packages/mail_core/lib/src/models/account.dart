import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/enums.dart';

part 'account.freezed.dart';
part 'account.g.dart';

/// Email account configuration.
@freezed
class Account with _$Account {
  const factory Account({
    required String id,
    required String email,
    @Default('') String displayName,
    required MailProvider provider,
    required MailProtocol protocol,
    required AuthMethod authMethod,

    // IMAP settings
    String? imapHost,
    @Default(993) int imapPort,
    @Default(true) bool imapSsl,

    // SMTP settings
    String? smtpHost,
    @Default(587) int smtpPort,
    @Default(false) bool smtpSsl,
    @Default(true) bool smtpStartTls,

    // POP3 settings
    String? pop3Host,
    @Default(995) int pop3Port,
    @Default(true) bool pop3Ssl,

    // OAuth2
    String? oauthProvider,
    String? refreshToken,

    // Sync settings
    @Default(15) int syncIntervalMinutes,
    @Default(30) int syncDaysBack,

    // Status
    @Default(true) bool isActive,
    @Default(false) bool isDefault,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

/// Account connection status.
@freezed
class AccountStatus with _$AccountStatus {
  const factory AccountStatus({
    required String accountId,
    @Default(false) bool isConnected,
    @Default(false) bool isSyncing,
    String? lastError,
    DateTime? lastSyncAt,
    @Default(0) int unreadCount,
  }) = _AccountStatus;

  factory AccountStatus.fromJson(Map<String, dynamic> json) =>
      _$AccountStatusFromJson(json);
}

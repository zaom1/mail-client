import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/enums.dart';
import 'message.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

/// Contact information (auto-collected from emails or manually added).
@freezed
class Contact with _$Contact {
  const factory Contact({
    required String id,
    required String email,
    String? name,
    @Default('auto') String source,
    @Default(1) int frequency,
    DateTime? lastContactAt,
    String? avatarUrl,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

/// Outbox message for send queue.
@freezed
class OutboxMessage with _$OutboxMessage {
  const factory OutboxMessage({
    required String id,
    required String accountId,
    required String rawMime,
    String? subject,
    @Default(<EmailAddress>[]) List<EmailAddress> to,
    @Default(<EmailAddress>[]) List<EmailAddress> cc,
    @Default(<EmailAddress>[]) List<EmailAddress> bcc,
    @Default(SendStatus.queued) SendStatus status,
    @Default(0) int retryCount,
    String? errorMessage,
    required DateTime createdAt,
    DateTime? sentAt,
  }) = _OutboxMessage;

  factory OutboxMessage.fromJson(Map<String, dynamic> json) =>
      _$OutboxMessageFromJson(json);
}

/// Email server configuration discovered via autoconfig.
@freezed
class ServerConfig with _$ServerConfig {
  const factory ServerConfig({
    required String host,
    required int port,
    @Default(true) bool ssl,
    @Default(false) bool startTls,
    String? username,
  }) = _ServerConfig;

  factory ServerConfig.fromJson(Map<String, dynamic> json) =>
      _$ServerConfigFromJson(json);
}

/// Auto-discovered email configuration for a domain.
@freezed
class AutoConfig with _$AutoConfig {
  const factory AutoConfig({
    required String domain,
    ServerConfig? imap,
    ServerConfig? smtp,
    ServerConfig? pop3,
    MailProvider? provider,
  }) = _AutoConfig;

  factory AutoConfig.fromJson(Map<String, dynamic> json) =>
      _$AutoConfigFromJson(json);
}

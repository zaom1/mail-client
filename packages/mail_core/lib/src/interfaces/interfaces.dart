import '../enums/enums.dart';
import '../models/account.dart';
import '../models/folder.dart';
import '../models/message.dart';
import '../models/contact.dart';

/// Abstract mail service interface for dependency injection.
abstract class IMailService {
  Future<List<Folder>> getFolders(String accountId);
  Future<List<Message>> getMessages(String accountId, String folderId, {int? limit, int? offset});
  Future<Message?> getMessage(String accountId, String messageId);
  Future<void> markAsRead(String accountId, String messageId, bool read);
  Future<void> markAsFlagged(String accountId, String messageId, bool flagged);
  Future<void> moveMessage(String accountId, String messageId, String targetFolderId);
  Future<void> deleteMessage(String accountId, String messageId);
  Future<void> sendMessage(String accountId, OutboxMessage message);
  Future<List<Message>> search(String accountId, String query);
}

/// Abstract authenticator interface.
abstract class IAuthenticator {
  Future<Account> authenticate(MailProvider provider);
  Future<void> refreshToken(Account account);
  Future<void> revokeToken(Account account);
  Future<bool> validateToken(Account account);
}

/// Abstract sync engine interface.
abstract class ISyncEngine {
  Future<void> startSync(String accountId);
  Future<void> stopSync(String accountId);
  Future<void> syncFolder(String accountId, String folderId);
  Stream<SyncEvent> get syncEvents;
}

/// Sync event types.
sealed class SyncEvent {
  const SyncEvent();
}

class NewMessageEvent extends SyncEvent {
  const NewMessageEvent({required this.accountId, required this.folderId, required this.message});
  final String accountId;
  final String folderId;
  final Message message;
}

class MessageDeletedEvent extends SyncEvent {
  const MessageDeletedEvent({required this.accountId, required this.folderId, required this.messageId});
  final String accountId;
  final String folderId;
  final String messageId;
}

class MessageUpdatedEvent extends SyncEvent {
  const MessageUpdatedEvent({required this.accountId, required this.message});
  final String accountId;
  final Message message;
}

class SyncErrorEvent extends SyncEvent {
  const SyncErrorEvent({required this.accountId, required this.error});
  final String accountId;
  final String error;
}

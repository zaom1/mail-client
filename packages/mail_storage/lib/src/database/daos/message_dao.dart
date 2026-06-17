import 'package:drift/drift.dart';
import 'package:mail_core/mail_core.dart';

import '../mail_database.dart';
import '../tables/tables.dart';

part 'message_dao.g.dart';

@DriftAccessor(tables: [Messages, Attachments])
class MessageDao extends DatabaseAccessor<MailDatabase>
    with _$MessageDaoMixin {
  MessageDao(super.db);

  /// Get messages for a folder with pagination.
  Future<List<Message>> getMessages(
    String accountId,
    String folderId, {
    int limit = 50,
    int offset = 0,
  }) async {
    final rows = await (select(messages)
          ..where((t) =>
              t.accountId.equals(accountId) &
              t.folderId.equals(folderId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(limit, offset: offset))
        .get();
    return rows.map(_rowToModel).toList();
  }

  /// Watch messages for a folder.
  Stream<List<Message>> watchMessages(String accountId, String folderId) {
    return (select(messages)
          ..where((t) =>
              t.accountId.equals(accountId) &
              t.folderId.equals(folderId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .watch()
        .map((rows) => rows.map(_rowToModel).toList());
  }

  /// Get a single message.
  Future<Message?> getMessage(String id) async {
    final row = await (select(messages)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row != null ? _rowToModel(row) : null;
  }

  /// Insert or update a message.
  Future<void> upsertMessage(Message message) async {
    await into(messages).insertOnConflictUpdate(
      MessagesCompanion.insert(
        id: message.id,
        accountId: message.accountId,
        folderId: message.folderId,
        uid: message.uid,
        messageId: Value(message.messageId),
        subject: Value(message.subject),
        fromAddress: Value(message.from?.email),
        fromName: Value(message.from?.name),
        toAddresses: Value(
          message.to.map((e) => e.display).join(', '),
        ),
        ccAddresses: Value(
          message.cc.map((e) => e.display).join(', '),
        ),
        date: message.date.millisecondsSinceEpoch,
        isRead: Value(message.isRead),
        isFlagged: Value(message.isFlagged),
        isAnswered: Value(message.isAnswered),
        hasAttachments: Value(message.hasAttachments),
        previewText: Value(message.previewText),
        bodyHtml: Value(message.bodyHtml),
        bodyText: Value(message.bodyText),
        size: Value(message.size),
        flags: Value(message.flags.map((f) => f.name).join(',')),
        createdAt: message.createdAt.millisecondsSinceEpoch,
      ),
    );
  }

  /// Mark message as read/unread.
  Future<void> markAsRead(String id, bool read) async {
    await (update(messages)..where((t) => t.id.equals(id))).write(
      MessagesCompanion(isRead: Value(read)),
    );
  }

  /// Mark message as flagged/unflagged.
  Future<void> markAsFlagged(String id, bool flagged) async {
    await (update(messages)..where((t) => t.id.equals(id))).write(
      MessagesCompanion(isFlagged: Value(flagged)),
    );
  }

  /// Move message to another folder.
  Future<void> moveMessage(String id, String targetFolderId) async {
    await (update(messages)..where((t) => t.id.equals(id))).write(
      MessagesCompanion(folderId: Value(targetFolderId)),
    );
  }

  /// Delete a message.
  Future<void> deleteMessage(String id) async {
    await (delete(messages)..where((t) => t.id.equals(id))).go();
  }

  /// Search messages using FTS5.
  Future<List<Message>> searchMessages(String accountId, String query) async {
    final rows = await customSelect(
      '''
      SELECT m.* FROM messages m
      JOIN search_index si ON m.message_id = si.message_id
      WHERE m.account_id = ? AND search_index MATCH ?
      ORDER BY m.date DESC
      LIMIT 100
      ''',
      variables: [Variable.withString(accountId), Variable.withString(query)],
      readsFrom: {messages},
    ).get();

    return rows.map((row) {
      final data = MessageRow(
        id: row.read<String>('id'),
        accountId: row.read<String>('account_id'),
        folderId: row.read<String>('folder_id'),
        uid: row.read<int>('uid'),
        messageId: row.read<String?>('message_id'),
        subject: row.read<String?>('subject'),
        fromAddress: row.read<String?>('from_address'),
        fromName: row.read<String?>('from_name'),
        toAddresses: row.read<String?>('to_addresses'),
        ccAddresses: row.read<String?>('cc_addresses'),
        bccAddresses: row.read<String?>('bcc_addresses'),
        replyTo: row.read<String?>('reply_to'),
        date: row.read<int>('date'),
        isRead: row.read<bool>('is_read'),
        isFlagged: row.read<bool>('is_flagged'),
        isAnswered: row.read<bool>('is_answered'),
        isForwarded: row.read<bool>('is_forwarded'),
        hasAttachments: row.read<bool>('has_attachments'),
        previewText: row.read<String?>('preview_text'),
        bodyHtml: row.read<String?>('body_html'),
        bodyText: row.read<String?>('body_text'),
        size: row.read<int>('size'),
        flags: row.read<String?>('flags'),
        inReplyTo: row.read<String?>('in_reply_to'),
        references: row.read<String?>('references'),
        syncStatus: row.read<String>('sync_status'),
        createdAt: row.read<int>('created_at'),
      );
      return _rowToModel(data);
    }).toList();
  }

  Message _rowToModel(MessageRow row) {
    return Message(
      id: row.id,
      accountId: row.accountId,
      folderId: row.folderId,
      uid: row.uid,
      messageId: row.messageId,
      subject: row.subject,
      from: row.fromAddress != null
          ? EmailAddress(email: row.fromAddress!, name: row.fromName)
          : null,
      date: DateTime.fromMillisecondsSinceEpoch(row.date),
      isRead: row.isRead,
      isFlagged: row.isFlagged,
      isAnswered: row.isAnswered,
      isForwarded: row.isForwarded,
      hasAttachments: row.hasAttachments,
      previewText: row.previewText,
      bodyHtml: row.bodyHtml,
      bodyText: row.bodyText,
      size: row.size,
      flags: row.flags != null
          ? row.flags!
              .split(',')
              .where((f) => f.isNotEmpty)
              .map((f) => MessageFlag.values.firstWhere(
                    (e) => e.name == f,
                    orElse: () => MessageFlag.seen,
                  ))
              .toList()
          : [],
      createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
    );
  }
}

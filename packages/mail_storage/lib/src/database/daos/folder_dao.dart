import 'package:drift/drift.dart';
import 'package:mail_core/mail_core.dart';

import '../mail_database.dart';
import '../tables/tables.dart';

part 'folder_dao.g.dart';

@DriftAccessor(tables: [Folders])
class FolderDao extends DatabaseAccessor<MailDatabase>
    with _$FolderDaoMixin {
  FolderDao(super.db);

  /// Get all folders for an account.
  Future<List<Folder>> getFolders(String accountId) async {
    final rows = await (select(folders)
          ..where((t) => t.accountId.equals(accountId)))
        .get();
    return rows.map(_rowToModel).toList();
  }

  /// Watch folders for an account.
  Stream<List<Folder>> watchFolders(String accountId) {
    return (select(folders)..where((t) => t.accountId.equals(accountId)))
        .watch()
        .map((rows) => rows.map(_rowToModel).toList());
  }

  /// Get a specific folder.
  Future<Folder?> getFolder(String id) async {
    final row = await (select(folders)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row != null ? _rowToModel(row) : null;
  }

  /// Insert or update a folder.
  Future<void> upsertFolder(Folder folder) async {
    await into(folders).insertOnConflictUpdate(
      FoldersCompanion.insert(
        id: folder.id,
        accountId: folder.accountId,
        name: folder.name,
        displayName: Value(folder.displayName),
        folderType: Value(folder.folderType?.name),
        parentId: Value(folder.parentId),
        uidValidity: Value(folder.uidValidity),
        uidNext: Value(folder.uidNext),
        messageCount: Value(folder.messageCount),
        unseenCount: Value(folder.unseenCount),
        isSubscribed: Value(folder.isSubscribed),
        lastSyncAt: Value(folder.lastSyncAt?.millisecondsSinceEpoch),
      ),
    );
  }

  /// Update folder counts.
  Future<void> updateCounts(String id, int messageCount, int unseenCount) async {
    await (update(folders)..where((t) => t.id.equals(id))).write(
      FoldersCompanion(
        messageCount: Value(messageCount),
        unseenCount: Value(unseenCount),
      ),
    );
  }

  /// Delete all folders for an account.
  Future<void> deleteFolders(String accountId) async {
    await (delete(folders)..where((t) => t.accountId.equals(accountId))).go();
  }

  Folder _rowToModel(FolderRow row) {
    return Folder(
      id: row.id,
      accountId: row.accountId,
      name: row.name,
      displayName: row.displayName,
      folderType: row.folderType != null
          ? FolderType.values.firstWhere(
              (e) => e.name == row.folderType,
              orElse: () => FolderType.custom,
            )
          : null,
      parentId: row.parentId,
      uidValidity: row.uidValidity,
      uidNext: row.uidNext,
      messageCount: row.messageCount,
      unseenCount: row.unseenCount,
      isSubscribed: row.isSubscribed,
      lastSyncAt: row.lastSyncAt != null
          ? DateTime.fromMillisecondsSinceEpoch(row.lastSyncAt!)
          : null,
    );
  }
}

import 'package:drift/drift.dart';
import 'package:mail_core/mail_core.dart';

import '../mail_database.dart';
import '../tables/tables.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [Accounts])
class AccountDao extends DatabaseAccessor<MailDatabase>
    with _$AccountDaoMixin {
  AccountDao(super.db);

  /// Get all accounts.
  Future<List<Account>> getAllAccounts() async {
    final rows = await select(accounts).get();
    return rows.map(_rowToModel).toList();
  }

  /// Get account by ID.
  Future<Account?> getAccount(String id) async {
    final row = await (select(accounts)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row != null ? _rowToModel(row) : null;
  }

  /// Get the default account.
  Future<Account?> getDefaultAccount() async {
    final row = await (select(accounts)..where((t) => t.isDefault.equals(true)))
        .getSingleOrNull();
    return row != null ? _rowToModel(row) : null;
  }

  /// Watch all accounts for changes.
  Stream<List<Account>> watchAllAccounts() {
    return select(accounts).watch().map(
          (rows) => rows.map(_rowToModel).toList(),
        );
  }

  /// Insert or update an account.
  Future<void> upsertAccount(Account account) async {
    await into(accounts).insertOnConflictUpdate(
      AccountsCompanion.insert(
        id: account.id,
        email: account.email,
        displayName: Value(account.displayName),
        provider: account.provider.name,
        protocol: account.protocol.name,
        authMethod: account.authMethod.name,
        imapHost: Value(account.imapHost),
        imapPort: Value(account.imapPort),
        imapSsl: Value(account.imapSsl),
        smtpHost: Value(account.smtpHost),
        smtpPort: Value(account.smtpPort),
        smtpSsl: Value(account.smtpSsl),
        smtpStartTls: Value(account.smtpStartTls),
        oauthProvider: Value(account.oauthProvider),
        syncIntervalMinutes: Value(account.syncIntervalMinutes),
        syncDaysBack: Value(account.syncDaysBack),
        isActive: Value(account.isActive),
        isDefault: Value(account.isDefault),
        createdAt: account.createdAt.millisecondsSinceEpoch,
        updatedAt: account.updatedAt.millisecondsSinceEpoch,
      ),
    );
  }

  /// Delete an account.
  Future<void> deleteAccount(String id) async {
    await (delete(accounts)..where((t) => t.id.equals(id))).go();
  }

  Account _rowToModel(AccountRow row) {
    return Account(
      id: row.id,
      email: row.email,
      displayName: row.displayName,
      provider: MailProvider.values.firstWhere(
        (e) => e.name == row.provider,
        orElse: () => MailProvider.custom,
      ),
      protocol: MailProtocol.values.firstWhere(
        (e) => e.name == row.protocol,
        orElse: () => MailProtocol.imap,
      ),
      authMethod: AuthMethod.values.firstWhere(
        (e) => e.name == row.authMethod,
        orElse: () => AuthMethod.password,
      ),
      imapHost: row.imapHost,
      imapPort: row.imapPort,
      imapSsl: row.imapSsl,
      smtpHost: row.smtpHost,
      smtpPort: row.smtpPort,
      smtpSsl: row.smtpSsl,
      smtpStartTls: row.smtpStartTls,
      oauthProvider: row.oauthProvider,
      syncIntervalMinutes: row.syncIntervalMinutes,
      syncDaysBack: row.syncDaysBack,
      isActive: row.isActive,
      isDefault: row.isDefault,
      createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(row.updatedAt),
    );
  }
}

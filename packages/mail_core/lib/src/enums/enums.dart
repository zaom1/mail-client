/// Email protocol type.
enum MailProtocol {
  imap,
  pop3,
  exchange,
  graphApi,
  gmailApi,
}

/// Email provider type for auto-configuration.
enum MailProvider {
  gmail,
  outlook,
  icloud,
  yahoo,
  aol,
  qq,
  netease163,
  netease126,
  custom,
}

/// Authentication method.
enum AuthMethod {
  oauth2,
  password,
  appSpecificPassword,
  xoauth2,
}

/// Folder type classification.
enum FolderType {
  inbox,
  sent,
  drafts,
  trash,
  junk,
  archive,
  all,
  flagged,
  custom,
}

/// Message flag status.
enum MessageFlag {
  seen,
  answered,
  flagged,
  deleted,
  draft,
  recent,
  forwarded,
}

/// Sync status for offline support.
enum SyncStatus {
  synced,
  pending,
  conflict,
  error,
}

/// Send status for outbox messages.
enum SendStatus {
  queued,
  sending,
  sent,
  failed,
  draft,
}

/// Attachment download status.
enum DownloadStatus {
  pending,
  downloading,
  completed,
  failed,
  notDownloaded,
}

/// Plugin permission types.
enum PluginPermission {
  mailRead,
  mailWrite,
  mailSend,
  uiCompose,
  uiSidebar,
  uiToolbar,
  uiContextMenu,
  network,
  storage,
  contactsRead,
  accountsManage,
}

/// Plugin lifecycle state.
enum PluginState {
  installed,
  activating,
  active,
  deactivating,
  inactive,
  error,
  uninstalled,
}

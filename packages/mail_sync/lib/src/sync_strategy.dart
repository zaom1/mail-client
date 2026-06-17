/// Sync strategy for different scenarios.
abstract class SyncStrategy {
  Future<void> sync();
  void cancel();
}

/// Full sync strategy - syncs all messages.
class FullSyncStrategy extends SyncStrategy {
  @override
  Future<void> sync() async {
    // TODO: Implement full sync
  }

  @override
  void cancel() {}
}

/// Incremental sync strategy - only syncs new/changed messages.
class IncrementalSyncStrategy extends SyncStrategy {
  @override
  Future<void> sync() async {
    // TODO: Implement incremental sync
  }

  @override
  void cancel() {}
}

/// Quick sync strategy - only checks for new messages count.
class QuickSyncStrategy extends SyncStrategy {
  @override
  Future<void> sync() async {
    // TODO: Implement quick sync
  }

  @override
  void cancel() {}
}

import 'dart:async';
import 'package:logger/logger.dart';

/// Background sync manager for periodic email synchronization.
class BackgroundSync {
  final Logger _logger = Logger();
  Timer? _syncTimer;

  /// Start periodic background sync.
  void startPeriodicSync({
    required Duration interval,
    required Future<void> Function() syncCallback,
  }) {
    _syncTimer?.cancel();
    _syncTimer = Timer.periodic(interval, (_) async {
      _logger.d('Running background sync');
      try {
        await syncCallback();
      } catch (e) {
        _logger.w('Background sync failed', error: e);
      }
    });
    _logger.i('Background sync started with interval: $interval');
  }

  /// Stop periodic background sync.
  void stopPeriodicSync() {
    _syncTimer?.cancel();
    _syncTimer = null;
    _logger.i('Background sync stopped');
  }

  /// Whether background sync is active.
  bool get isActive => _syncTimer?.isActive ?? false;

  /// Dispose.
  void dispose() {
    stopPeriodicSync();
  }
}

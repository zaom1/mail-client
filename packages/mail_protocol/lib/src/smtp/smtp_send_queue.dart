import 'dart:async';
import 'package:logger/logger.dart';
import 'smtp_client.dart';
import 'package:enough_mail/enough_mail.dart';

/// Queued email message for sending.
class QueuedMessage {
  final String id;
  final MimeMessage message;
  int retryCount;
  DateTime? nextRetryAt;

  QueuedMessage({
    required this.id,
    required this.message,
    this.retryCount = 0,
    this.nextRetryAt,
  });
}

/// SMTP send queue with retry logic and offline support.
class SmtpSendQueue {
  final Logger _logger = Logger();
  final List<QueuedMessage> _queue = [];
  final StreamController<SendEvent> _eventController =
      StreamController<SendEvent>.broadcast();
  bool _isProcessing = false;

  /// Stream of send events.
  Stream<SendEvent> get events => _eventController.stream;

  /// Add a message to the send queue.
  void enqueue(String id, MimeMessage message) {
    _queue.add(QueuedMessage(id: id, message: message));
    _logger.i('Message $id added to send queue');
    _eventController.add(SendEventQueued(id: id));
    _processQueue();
  }

  /// Process the send queue.
  Future<void> _processQueue() async {
    if (_isProcessing || _queue.isEmpty) return;
    _isProcessing = true;

    while (_queue.isNotEmpty) {
      final queued = _queue.first;

      // Check if we should retry later
      if (queued.nextRetryAt != null &&
          DateTime.now().isBefore(queued.nextRetryAt!)) {
        break;
      }

      _queue.removeAt(0);
      _eventController.add(SendEventSending(id: queued.id));

      try {
        // TODO: Get SMTP client from connection pool
        // For now, this is a placeholder
        _logger.i('Sending message ${queued.id}');

        // Simulate sending
        await Future<void>.delayed(const Duration(seconds: 1));

        _eventController.add(SendEventSent(id: queued.id));
        _logger.i('Message ${queued.id} sent successfully');
      } catch (e) {
        _handleSendError(queued, e);
      }
    }

    _isProcessing = false;
  }

  /// Handle send error with retry logic.
  void _handleSendError(QueuedMessage queued, Object error) {
    queued.retryCount++;

    if (queued.retryCount >= 5) {
      // Permanent failure
      _eventController.add(SendEventFailed(
        id: queued.id,
        error: error.toString(),
        permanent: true,
      ));
      _logger.e('Message ${queued.id} permanently failed', error: error);
      return;
    }

    // Exponential backoff: 1s, 2s, 4s, 8s, 16s
    final delay = Duration(seconds: 1 << queued.retryCount);
    queued.nextRetryAt = DateTime.now().add(delay);
    _queue.add(queued);

    _eventController.add(SendEventFailed(
      id: queued.id,
      error: error.toString(),
      permanent: false,
      retryAt: queued.nextRetryAt,
    ));
    _logger.w(
      'Message ${queued.id} failed, retry ${queued.retryCount}/5 at ${queued.nextRetryAt}',
    );
  }

  /// Cancel a queued message.
  void cancel(String id) {
    _queue.removeWhere((m) => m.id == id);
    _eventController.add(SendEventCancelled(id: id));
  }

  /// Get queue size.
  int get size => _queue.length;

  /// Dispose the queue.
  void dispose() {
    _eventController.close();
  }
}

/// Send event types.
sealed class SendEvent {
  const SendEvent({required this.id});
  final String id;
}

class SendEventQueued extends SendEvent {
  const SendEventQueued({required super.id});
}

class SendEventSending extends SendEvent {
  const SendEventSending({required super.id});
}

class SendEventSent extends SendEvent {
  const SendEventSent({required super.id});
}

class SendEventFailed extends SendEvent {
  const SendEventFailed({
    required super.id,
    required this.error,
    this.permanent = false,
    this.retryAt,
  });
  final String error;
  final bool permanent;
  final DateTime? retryAt;
}

class SendEventCancelled extends SendEvent {
  const SendEventCancelled({required super.id});
}

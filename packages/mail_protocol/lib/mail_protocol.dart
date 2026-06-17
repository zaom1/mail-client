/// Email protocol implementations and OAuth2 authentication.
library mail_protocol;

export 'src/imap/imap_client.dart';
export 'src/imap/imap_connection_pool.dart';
export 'src/imap/imap_idle_manager.dart';
export 'src/smtp/smtp_client.dart';
export 'src/smtp/smtp_send_queue.dart';
export 'src/pop3/pop3_client.dart';
export 'src/auth/oauth2_manager.dart';
export 'src/auth/oauth2_providers.dart';
export 'src/auth/credentials_store.dart';
export 'src/discovery/autoconfig.dart';
export 'src/mime/mime_parser.dart';
export 'src/mime/html_sanitizer.dart';
export 'src/mime/message_builder.dart';

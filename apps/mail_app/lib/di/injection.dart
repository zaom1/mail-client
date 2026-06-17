import 'package:get_it/get_it.dart';
import 'package:mail_storage/mail_storage.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Database
  final database = MailDatabase();
  await database.initialize();
  getIt.registerSingleton<MailDatabase>(database);

  // Register other services here as they are implemented
  // getIt.registerSingleton<SyncEngine>(...);
  // getIt.registerSingleton<PluginRegistry>(...);
}

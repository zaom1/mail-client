import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'di/injection.dart';
import 'platform/platform_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Platform-specific initialization
  await platformInit();

  // Initialize dependency injection
  await configureDependencies();

  runApp(
    const ProviderScope(
      child: MailApp(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail_ui_kit/mail_ui_kit.dart';

import 'routing/app_router.dart';

class MailApp extends ConsumerWidget {
  const MailApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Mail Client',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
      localizationsDelegates: const [
        // Add localization delegates here
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
      ],
    );
  }
}

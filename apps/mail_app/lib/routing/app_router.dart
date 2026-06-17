import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/login_screen.dart';
import '../features/auth/account_setup_screen.dart';
import '../features/inbox/inbox_screen.dart';
import '../features/compose/compose_screen.dart';
import '../features/reader/mail_reader_screen.dart';
import '../features/search/search_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/settings/account_settings_screen.dart';
import '../features/plugins/plugin_manager_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/account-setup',
        builder: (context, state) => const AccountSetupScreen(),
      ),
      GoRoute(
        path: '/inbox',
        builder: (context, state) => const InboxScreen(),
        routes: [
          GoRoute(
            path: 'message/:messageId',
            builder: (context, state) => MailReaderScreen(
              messageId: state.pathParameters['messageId']!,
            ),
          ),
          GoRoute(
            path: 'compose',
            builder: (context, state) => const ComposeScreen(),
          ),
          GoRoute(
            path: 'search',
            builder: (context, state) => const SearchScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: 'account/:accountId',
            builder: (context, state) => AccountSettingsScreen(
              accountId: state.pathParameters['accountId']!,
            ),
          ),
          GoRoute(
            path: 'plugins',
            builder: (context, state) => const PluginManagerScreen(),
          ),
        ],
      ),
    ],
  );
});

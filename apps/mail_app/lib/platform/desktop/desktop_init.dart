import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

/// Desktop-specific initialization and window management.
class DesktopInit {
  /// Initialize desktop platform features.
  static Future<void> initialize() async {
    if (!kIsWeb &&
        (Platform.isWindows || Platform.isMacOS || Platform.isLinux)) {
      await windowManager.ensureInitialized();

      const windowOptions = WindowOptions(
        size: Size(1280, 800),
        minimumSize: Size(800, 600),
        center: true,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.hidden,
        title: 'Mail Client',
      );

      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    }
  }

  /// Set window title.
  static Future<void> setTitle(String title) async {
    await windowManager.setTitle(title);
  }

  /// Minimize to system tray.
  static Future<void> minimizeToTray() async {
    await windowManager.hide();
  }

  /// Set badge count (macOS only).
  static Future<void> setBadgeCount(int count) async {
    if (Platform.isMacOS) {
      // TODO: Implement badge count using appkit
    }
  }
}

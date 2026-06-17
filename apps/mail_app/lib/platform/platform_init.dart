import 'package:flutter/foundation.dart';

/// Platform-specific initialization.
/// Called before runApp to set up platform-dependent services.
Future<void> platformInit() async {
  if (kIsWeb) {
    await _initWeb();
  } else if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux) {
    await _initDesktop();
  } else if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    await _initMobile();
  }
}

Future<void> _initWeb() async {
  // Web-specific initialization
  // Service worker registration is handled by Flutter's index.html
}

Future<void> _initDesktop() async {
  // Desktop-specific initialization
  // Window manager setup will be done in desktop_init.dart
}

Future<void> _initMobile() async {
  // Mobile-specific initialization
  // Push notification setup, workmanager, etc.
}

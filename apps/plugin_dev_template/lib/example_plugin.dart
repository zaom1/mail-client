import 'package:mail_plugin_system/mail_plugin_system.dart';

/// Example plugin that adds a signature to emails.
class SignaturePlugin implements MailPlugin {
  @override
  PluginMetadata get metadata => const PluginMetadata(
        id: 'signature-plugin',
        name: 'Smart Signature',
        version: '1.0.0',
        author: 'Mail Client Team',
        description: 'Automatically adds professional signatures to your emails.',
        permissions: [PluginPermission.mailWrite, PluginPermission.uiCompose],
        hooks: ['onBeforeSend', 'onComposeToolbar'],
      );

  @override
  Future<void> onActivate(PluginContext context) async {
    // Plugin activated - set up signature functionality
  }

  @override
  Future<void> onDeactivate() async {
    // Plugin deactivated - clean up
  }

  @override
  Future<void> onSettingsChanged(Map<String, dynamic> settings) async {
    // Handle settings changes
  }
}

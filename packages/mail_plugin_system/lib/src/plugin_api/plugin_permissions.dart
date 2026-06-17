import 'package:mail_core/mail_core.dart';

/// Plugin permission checker.
class PluginPermissionChecker {
  final Set<PluginPermission> _grantedPermissions;

  PluginPermissionChecker(List<PluginPermission> granted)
      : _grantedPermissions = granted.toSet();

  /// Check if a permission is granted.
  bool hasPermission(PluginPermission permission) {
    return _grantedPermissions.contains(permission);
  }

  /// Validate that all required permissions are granted.
  bool validatePermissions(List<PluginPermission> required) {
    return required.every(_grantedPermissions.contains);
  }

  /// Get risk level description for a permission.
  static String getRiskDescription(PluginPermission permission) {
    switch (permission) {
      case PluginPermission.mailSend:
      case PluginPermission.accountsManage:
        return 'High risk - can send emails or modify account settings';
      case PluginPermission.mailRead:
      case PluginPermission.mailWrite:
      case PluginPermission.network:
      case PluginPermission.contactsRead:
        return 'Medium risk - can access data or make network requests';
      case PluginPermission.uiCompose:
      case PluginPermission.uiSidebar:
      case PluginPermission.uiToolbar:
      case PluginPermission.uiContextMenu:
      case PluginPermission.storage:
        return 'Low risk - UI extensions or local storage only';
    }
  }
}

/// OAuth2 provider-specific helpers and configurations.
library oauth2_providers;

/// Known OAuth2 email provider helpers.
abstract class OAuth2ProviderHelper {
  String get name;
  String get displayName;
  List<String> get scopes;

  /// Map email domain to provider.
  static OAuth2ProviderHelper? fromEmail(String email) {
    final domain = email.split('@').last.toLowerCase();

    if (['gmail.com', 'googlemail.com'].contains(domain)) {
      return GoogleOAuth2Helper();
    }
    if (['outlook.com', 'hotmail.com', 'live.com'].contains(domain)) {
      return MicrosoftOAuth2Helper();
    }
    return null;
  }
}

/// Google OAuth2 helper.
class GoogleOAuth2Helper extends OAuth2ProviderHelper {
  @override
  String get name => 'google';

  @override
  String get displayName => 'Google';

  @override
  List<String> get scopes => [
        'https://mail.google.com/',
        'https://www.googleapis.com/auth/gmail.modify',
        'https://www.googleapis.com/auth/gmail.send',
        'email',
        'profile',
      ];
}

/// Microsoft OAuth2 helper.
class MicrosoftOAuth2Helper extends OAuth2ProviderHelper {
  @override
  String get name => 'microsoft';

  @override
  String get displayName => 'Microsoft';

  @override
  List<String> get scopes => [
        'Mail.Read',
        'Mail.ReadWrite',
        'Mail.Send',
        'offline_access',
        'IMAP.AccessAsUser.All',
        'SMTP.Send',
      ];
}

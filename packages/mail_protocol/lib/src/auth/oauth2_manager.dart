import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mail_core/mail_core.dart';

/// OAuth2 token response.
class OAuth2Token {
  final String accessToken;
  final String? refreshToken;
  final int expiresIn;
  final String tokenType;
  final String? scope;

  OAuth2Token({
    required this.accessToken,
    this.refreshToken,
    required this.expiresIn,
    this.tokenType = 'Bearer',
    this.scope,
  });

  factory OAuth2Token.fromJson(Map<String, dynamic> json) {
    return OAuth2Token(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String?,
      expiresIn: json['expires_in'] as int,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      scope: json['scope'] as String?,
    );
  }
}

/// OAuth2 provider configuration.
class OAuth2ProviderConfig {
  final String clientId;
  final String? clientSecret;
  final String authorizationEndpoint;
  final String tokenEndpoint;
  final String? redirectUri;
  final List<String> scopes;

  const OAuth2ProviderConfig({
    required this.clientId,
    this.clientSecret,
    required this.authorizationEndpoint,
    required this.tokenEndpoint,
    this.redirectUri,
    required this.scopes,
  });
}

/// OAuth2 authentication manager.
class OAuth2Manager {
  final Dio _dio = Dio();

  /// Registered OAuth2 provider configurations.
  /// NOTE: Client IDs should be replaced with your own registered app IDs.
  static const _providers = <String, OAuth2ProviderConfig>{
    'google': OAuth2ProviderConfig(
      clientId: 'YOUR_GOOGLE_CLIENT_ID', // Replace with actual client ID
      authorizationEndpoint: 'https://accounts.google.com/o/oauth2/v2/auth',
      tokenEndpoint: 'https://oauth2.googleapis.com/token',
      scopes: [
        'https://mail.google.com/',
        'https://www.googleapis.com/auth/gmail.modify',
        'https://www.googleapis.com/auth/gmail.send',
        'email',
        'profile',
      ],
    ),
    'microsoft': OAuth2ProviderConfig(
      clientId: 'YOUR_MICROSOFT_CLIENT_ID', // Replace with actual client ID
      authorizationEndpoint:
          'https://login.microsoftonline.com/common/oauth2/v2.0/authorize',
      tokenEndpoint:
          'https://login.microsoftonline.com/common/oauth2/v2.0/token',
      scopes: [
        'Mail.Read',
        'Mail.ReadWrite',
        'Mail.Send',
        'offline_access',
        'IMAP.AccessAsUser.All',
        'SMTP.Send',
      ],
    ),
  };

  /// Get the authorization URL for a provider.
  String getAuthorizationUrl(String provider, String redirectUri) {
    final config = _providers[provider];
    if (config == null) {
      throw ArgumentError('Unknown OAuth2 provider: $provider');
    }

    final params = {
      'client_id': config.clientId,
      'redirect_uri': redirectUri,
      'response_type': 'code',
      'scope': config.scopes.join(' '),
      'access_type': 'offline',
      'prompt': 'consent',
    };

    final uri = Uri.parse(config.authorizationEndpoint)
        .replace(queryParameters: params);
    return uri.toString();
  }

  /// Exchange authorization code for tokens.
  Future<OAuth2Token> exchangeCode(
    String provider,
    String code,
    String redirectUri, {
    String? codeVerifier,
  }) async {
    final config = _providers[provider];
    if (config == null) {
      throw ArgumentError('Unknown OAuth2 provider: $provider');
    }

    final data = <String, dynamic>{
      'client_id': config.clientId,
      'code': code,
      'redirect_uri': redirectUri,
      'grant_type': 'authorization_code',
    };

    if (config.clientSecret != null) {
      data['client_secret'] = config.clientSecret;
    }

    if (codeVerifier != null) {
      data['code_verifier'] = codeVerifier;
    }

    final response = await _dio.post(
      config.tokenEndpoint,
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return OAuth2Token.fromJson(response.data as Map<String, dynamic>);
  }

  /// Refresh an expired access token.
  Future<OAuth2Token> refreshToken(
    String provider,
    String refreshToken,
  ) async {
    final config = _providers[provider];
    if (config == null) {
      throw ArgumentError('Unknown OAuth2 provider: $provider');
    }

    final data = <String, dynamic>{
      'client_id': config.clientId,
      'refresh_token': refreshToken,
      'grant_type': 'refresh_token',
    };

    if (config.clientSecret != null) {
      data['client_secret'] = config.clientSecret;
    }

    final response = await _dio.post(
      config.tokenEndpoint,
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return OAuth2Token.fromJson(response.data as Map<String, dynamic>);
  }

  /// Revoke a token (sign out).
  Future<void> revokeToken(String provider, String token) async {
    switch (provider) {
      case 'google':
        await _dio.post(
          'https://oauth2.googleapis.com/revoke',
          data: {'token': token},
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ),
        );
      case 'microsoft':
        await _dio.post(
          'https://login.microsoftonline.com/common/oauth2/v2.0/logout',
          queryParameters: {'post_logout_redirect_uri': 'http://localhost'},
        );
    }
  }

  /// Generate PKCE code verifier and challenge.
  static ({String verifier, String challenge}) generatePkce() {
    // Generate random 32-byte code verifier
    final random = List<int>.generate(32, (i) => i); // Replace with secure random
    final verifier = base64UrlEncode(random).replaceAll('=', '');

    // SHA-256 hash for challenge (simplified - use crypto package in real app)
    final challenge = base64UrlEncode(utf8.encode(verifier)).replaceAll('=', '');

    return (verifier: verifier, challenge: challenge);
  }
}

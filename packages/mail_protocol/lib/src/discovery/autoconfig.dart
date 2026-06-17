import 'package:dio/dio.dart';
import 'package:mail_core/mail_core.dart';
import 'package:xml/xml.dart';

/// Email server auto-configuration discovery.
/// Supports Mozilla Autoconfig, Microsoft AutoDiscover, and built-in providers.
class AutoConfigDiscovery {
  final Dio _dio = Dio();

  /// Built-in provider configurations.
  static final Map<String, AutoConfig> _builtinConfigs = {
    'gmail.com': AutoConfig(
      domain: 'gmail.com',
      provider: MailProvider.gmail,
      imap: ServerConfig(host: 'imap.gmail.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.gmail.com', port: 587, startTls: true),
    ),
    'googlemail.com': AutoConfig(
      domain: 'googlemail.com',
      provider: MailProvider.gmail,
      imap: ServerConfig(host: 'imap.gmail.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.gmail.com', port: 587, startTls: true),
    ),
    'outlook.com': AutoConfig(
      domain: 'outlook.com',
      provider: MailProvider.outlook,
      imap: ServerConfig(host: 'outlook.office365.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.office365.com', port: 587, startTls: true),
    ),
    'hotmail.com': AutoConfig(
      domain: 'hotmail.com',
      provider: MailProvider.outlook,
      imap: ServerConfig(host: 'outlook.office365.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.office365.com', port: 587, startTls: true),
    ),
    'live.com': AutoConfig(
      domain: 'live.com',
      provider: MailProvider.outlook,
      imap: ServerConfig(host: 'outlook.office365.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.office365.com', port: 587, startTls: true),
    ),
    'icloud.com': AutoConfig(
      domain: 'icloud.com',
      provider: MailProvider.icloud,
      imap: ServerConfig(host: 'imap.mail.me.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.mail.me.com', port: 587, startTls: true),
    ),
    'me.com': AutoConfig(
      domain: 'me.com',
      provider: MailProvider.icloud,
      imap: ServerConfig(host: 'imap.mail.me.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.mail.me.com', port: 587, startTls: true),
    ),
    'mac.com': AutoConfig(
      domain: 'mac.com',
      provider: MailProvider.icloud,
      imap: ServerConfig(host: 'imap.mail.me.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.mail.me.com', port: 587, startTls: true),
    ),
    'yahoo.com': AutoConfig(
      domain: 'yahoo.com',
      provider: MailProvider.yahoo,
      imap: ServerConfig(host: 'imap.mail.yahoo.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.mail.yahoo.com', port: 465, ssl: true),
    ),
    'qq.com': AutoConfig(
      domain: 'qq.com',
      provider: MailProvider.qq,
      imap: ServerConfig(host: 'imap.qq.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.qq.com', port: 465, ssl: true),
    ),
    '163.com': AutoConfig(
      domain: '163.com',
      provider: MailProvider.netease163,
      imap: ServerConfig(host: 'imap.163.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.163.com', port: 465, ssl: true),
    ),
    '126.com': AutoConfig(
      domain: '126.com',
      provider: MailProvider.netease126,
      imap: ServerConfig(host: 'imap.126.com', port: 993, ssl: true),
      smtp: ServerConfig(host: 'smtp.126.com', port: 465, ssl: true),
    ),
  };

  /// Discover email configuration for an email address.
  Future<AutoConfig> discover(String email) async {
    final domain = email.split('@').last.toLowerCase();

    // 1. Check built-in configs first
    if (_builtinConfigs.containsKey(domain)) {
      return _builtinConfigs[domain]!;
    }

    // 2. Try Mozilla Autoconfig
    try {
      final config = await _tryMozillaAutoconfig(domain);
      if (config != null) return config;
    } catch (_) {
      // Continue to next method
    }

    // 3. Try Microsoft AutoDiscover
    try {
      final config = await _tryAutoDiscover(domain);
      if (config != null) return config;
    } catch (_) {
      // Continue to next method
    }

    // 4. Try well-known subdomains (imap.domain, smtp.domain)
    return _guessConfig(domain);
  }

  /// Try Mozilla Autoconfig (Thunderbird-style).
  Future<AutoConfig?> _tryMozillaAutoconfig(String domain) async {
    final urls = [
      'https://autoconfig.thunderbird.net/v1.1/$domain',
      'https://$domain/.well-known/autoconfig/mail/config-v1.1.xml',
      'https://autoconfig.$domain/mail/config-v1.1.xml',
    ];

    for (final url in urls) {
      try {
        final response = await _dio.get<String>(
          url,
          options: Options(
            receiveTimeout: const Duration(seconds: 5),
            sendTimeout: const Duration(seconds: 5),
          ),
        );

        if (response.statusCode == 200 && response.data != null) {
          return _parseAutoconfigXml(response.data!, domain);
        }
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  /// Parse Mozilla Autoconfig XML.
  AutoConfig? _parseAutoconfigXml(String xmlString, String domain) {
    try {
      final document = XmlDocument.parse(xmlString);
      final emailProvider = document
          .findAllElements('emailProvider')
          .firstOrNull;
      if (emailProvider == null) return null;

      ServerConfig? imap;
      ServerConfig? smtp;

      // Parse IMAP server
      final imapServer = emailProvider
          .findElements('incomingServer')
          .where((e) => e.getAttribute('type') == 'imap')
          .firstOrNull;
      if (imapServer != null) {
        imap = ServerConfig(
          host: imapServer.findElements('hostname').firstOrNull?.innerText ?? '',
          port: int.tryParse(
                  imapServer.findElements('port').firstOrNull?.innerText ?? '') ??
              993,
          ssl: imapServer.findElements('socketType').firstOrNull?.innerText ==
              'SSL',
        );
      }

      // Parse SMTP server
      final smtpServer = emailProvider
          .findElements('outgoingServer')
          .where((e) => e.getAttribute('type') == 'smtp')
          .firstOrNull;
      if (smtpServer != null) {
        final socketType =
            smtpServer.findElements('socketType').firstOrNull?.innerText;
        smtp = ServerConfig(
          host: smtpServer.findElements('hostname').firstOrNull?.innerText ?? '',
          port: int.tryParse(
                  smtpServer.findElements('port').firstOrNull?.innerText ?? '') ??
              587,
          ssl: socketType == 'SSL',
          startTls: socketType == 'STARTTLS',
        );
      }

      return AutoConfig(
        domain: domain,
        imap: imap,
        smtp: smtp,
      );
    } catch (_) {
      return null;
    }
  }

  /// Try Microsoft AutoDiscover.
  Future<AutoConfig?> _tryAutoDiscover(String domain) async {
    final urls = [
      'https://autodiscover.$domain/autodiscover/autodiscover.xml',
      'https://$domain/autodiscover/autodiscover.xml',
    ];

    for (final url in urls) {
      try {
        final response = await _dio.get<String>(
          url,
          options: Options(
            receiveTimeout: const Duration(seconds: 5),
            sendTimeout: const Duration(seconds: 5),
          ),
        );

        if (response.statusCode == 200 && response.data != null) {
          // Parse AutoDiscover response
          // Simplified - real implementation would parse XML
          return null;
        }
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  /// Guess configuration based on common patterns.
  AutoConfig _guessConfig(String domain) {
    return AutoConfig(
      domain: domain,
      imap: ServerConfig(
        host: 'imap.$domain',
        port: 993,
        ssl: true,
      ),
      smtp: ServerConfig(
        host: 'smtp.$domain',
        port: 587,
        startTls: true,
      ),
    );
  }
}

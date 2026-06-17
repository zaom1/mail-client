import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Account setup screen for manual IMAP/SMTP/POP3 configuration.
class AccountSetupScreen extends ConsumerStatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  ConsumerState<AccountSetupScreen> createState() =>
      _AccountSetupScreenState();
}

class _AccountSetupScreenState extends ConsumerState<AccountSetupScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // Email credentials
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameController = TextEditingController();

  // IMAP settings
  final _imapHostController = TextEditingController();
  final _imapPortController = TextEditingController(text: '993');
  bool _imapSSL = true;

  // SMTP settings
  final _smtpHostController = TextEditingController();
  final _smtpPortController = TextEditingController(text: '587');
  bool _smtpSSL = false;
  bool _smtpSTARTTLS = true;

  bool _isLoading = false;
  bool _autoConfigFailed = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _displayNameController.dispose();
    _imapHostController.dispose();
    _imapPortController.dispose();
    _smtpHostController.dispose();
    _smtpPortController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Email & Password section
                  Text(
                    'Account Information',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'you@example.com',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onChanged: _onEmailChanged,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      labelText: 'Display Name',
                      hintText: 'Your Name',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password / App Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  // Server Settings Tabs
                  if (_autoConfigFailed) ...[
                    Text(
                      'Auto-configuration failed. Please enter server settings manually.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'IMAP'),
                      Tab(text: 'SMTP'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    height: 280,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // IMAP Settings
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: _imapHostController,
                                    decoration: const InputDecoration(
                                      labelText: 'IMAP Host',
                                      hintText: 'imap.example.com',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    controller: _imapPortController,
                                    decoration: const InputDecoration(
                                      labelText: 'Port',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SwitchListTile(
                              title: const Text('Use SSL/TLS'),
                              value: _imapSSL,
                              onChanged: (value) {
                                setState(() {
                                  _imapSSL = value;
                                  if (value) {
                                    _imapPortController.text = '993';
                                  } else {
                                    _imapPortController.text = '143';
                                  }
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                            ),
                          ],
                        ),

                        // SMTP Settings
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: _smtpHostController,
                                    decoration: const InputDecoration(
                                      labelText: 'SMTP Host',
                                      hintText: 'smtp.example.com',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    controller: _smtpPortController,
                                    decoration: const InputDecoration(
                                      labelText: 'Port',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SwitchListTile(
                              title: const Text('Use SSL/TLS'),
                              value: _smtpSSL,
                              onChanged: (value) {
                                setState(() {
                                  _smtpSSL = value;
                                  if (value) {
                                    _smtpPortController.text = '465';
                                    _smtpSTARTTLS = false;
                                  }
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                            ),
                            SwitchListTile(
                              title: const Text('Use STARTTLS'),
                              value: _smtpSTARTTLS,
                              onChanged: (value) {
                                setState(() {
                                  _smtpSTARTTLS = value;
                                  if (value) {
                                    _smtpPortController.text = '587';
                                    _smtpSSL = false;
                                  }
                                });
                              },
                              contentPadding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => context.go('/login'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: FilledButton(
                          onPressed: _isLoading ? null : _connect,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text('Connect'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onEmailChanged(String email) {
    // Auto-detect common providers and fill in server settings
    final domain = email.split('@').last.toLowerCase();

    switch (domain) {
      case 'gmail.com':
      case 'googlemail.com':
        _imapHostController.text = 'imap.gmail.com';
        _smtpHostController.text = 'smtp.gmail.com';
        _imapPortController.text = '993';
        _smtpPortController.text = '587';
      case 'outlook.com':
      case 'hotmail.com':
      case 'live.com':
        _imapHostController.text = 'outlook.office365.com';
        _smtpHostController.text = 'smtp.office365.com';
        _imapPortController.text = '993';
        _smtpPortController.text = '587';
      case 'icloud.com':
      case 'me.com':
      case 'mac.com':
        _imapHostController.text = 'imap.mail.me.com';
        _smtpHostController.text = 'smtp.mail.me.com';
        _imapPortController.text = '993';
        _smtpPortController.text = '587';
      case 'yahoo.com':
        _imapHostController.text = 'imap.mail.yahoo.com';
        _smtpHostController.text = 'smtp.mail.yahoo.com';
        _imapPortController.text = '993';
        _smtpPortController.text = '465';
      case 'qq.com':
        _imapHostController.text = 'imap.qq.com';
        _smtpHostController.text = 'smtp.qq.com';
        _imapPortController.text = '993';
        _smtpPortController.text = '465';
      case '163.com':
        _imapHostController.text = 'imap.163.com';
        _smtpHostController.text = 'smtp.163.com';
        _imapPortController.text = '993';
        _smtpPortController.text = '465';
      default:
        // Try autoconfig for unknown domains
        _imapHostController.clear();
        _smtpHostController.clear();
    }
  }

  Future<void> _connect() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // TODO: Implement actual connection test using mail_protocol
      // 1. Try autoconfig discovery first
      // 2. If fails, use manual settings
      // 3. Test IMAP connection
      // 4. Test SMTP connection
      // 5. Save account to database
      // 6. Start initial sync

      await Future<void>.delayed(const Duration(seconds: 2));
      if (mounted) {
        context.go('/inbox');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Connection failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}

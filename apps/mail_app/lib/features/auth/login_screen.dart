import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Login screen - entry point for authentication.
/// Supports OAuth2 login for Gmail, Outlook, iCloud, and manual IMAP/SMTP setup.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // App Logo & Title
                Icon(
                  Icons.mail_outline_rounded,
                  size: 80,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Mail Client',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'A modern, cross-platform email experience',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 48),

                // OAuth2 Quick Login Buttons
                _ProviderLoginButton(
                  icon: Icons.account_circle_outlined,
                  label: 'Continue with Google',
                  color: const Color(0xFF4285F4),
                  onPressed: _isLoading ? null : () => _loginWithGoogle(),
                ),
                const SizedBox(height: 12),
                _ProviderLoginButton(
                  icon: Icons.window,
                  label: 'Continue with Microsoft',
                  color: const Color(0xFF00A4EF),
                  onPressed: _isLoading ? null : () => _loginWithMicrosoft(),
                ),
                const SizedBox(height: 12),
                _ProviderLoginButton(
                  icon: Icons.cloud_outlined,
                  label: 'Continue with iCloud',
                  color: const Color(0xFF333333),
                  onPressed: _isLoading ? null : () => _loginWithICloud(),
                ),

                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: colorScheme.outlineVariant)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: colorScheme.outlineVariant)),
                  ],
                ),

                const SizedBox(height: 24),

                // Manual IMAP/SMTP Setup
                OutlinedButton.icon(
                  onPressed: _isLoading
                      ? null
                      : () => context.go('/account-setup'),
                  icon: const Icon(Icons.settings_outlined),
                  label: const Text('Set up with IMAP/SMTP'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),

                if (_isLoading) ...[
                  const SizedBox(height: 24),
                  const LinearProgressIndicator(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loginWithGoogle() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implement OAuth2 flow for Google
      await Future<void>.delayed(const Duration(seconds: 1));
      if (mounted) context.go('/inbox');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loginWithMicrosoft() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implement OAuth2 flow for Microsoft
      await Future<void>.delayed(const Duration(seconds: 1));
      if (mounted) context.go('/inbox');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _loginWithICloud() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Implement iCloud App-Specific Password login
      await Future<void>.delayed(const Duration(seconds: 1));
      if (mounted) context.go('/inbox');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}

class _ProviderLoginButton extends StatelessWidget {
  const _ProviderLoginButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: FilledButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 14),
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}

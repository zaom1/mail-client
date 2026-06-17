import 'package:flutter/material.dart';

/// Color scheme definitions for the app.
class ColorSchemes {
  // Light color scheme
  static const lightScheme = ColorScheme.light(
    primary: Color(0xFF1565C0),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD1E4FF),
    onPrimaryContainer: Color(0xFF001D36),
    secondary: Color(0xFF535F70),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD7E3F7),
    onSecondaryContainer: Color(0xFF101C2B),
    tertiary: Color(0xFF6B5778),
    onTertiary: Color(0xFFFFFFFF),
    error: Color(0xFFBA1A1A),
    surface: Color(0xFFFEFBFF),
    onSurface: Color(0xFF1B1B1F),
  );

  // Dark color scheme
  static const darkScheme = ColorScheme.dark(
    primary: Color(0xFF9ECAFF),
    onPrimary: Color(0xFF003258),
    primaryContainer: Color(0xFF00497D),
    onPrimaryContainer: Color(0xFFD1E4FF),
    secondary: Color(0xFFBBC7DB),
    onSecondary: Color(0xFF253140),
    secondaryContainer: Color(0xFF3B4858),
    onSecondaryContainer: Color(0xFFD7E3F7),
    tertiary: Color(0xFFD7BDE4),
    onTertiary: Color(0xFF3B2948),
    error: Color(0xFFFFB4AB),
    surface: Color(0xFF1B1B1F),
    onSurface: Color(0xFFE3E2E6),
  );
}

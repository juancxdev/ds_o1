import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

/// Main theme class for O1 Design System
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: O1Theme.lightTheme,
///   darkTheme: O1Theme.darkTheme,
///   themeMode: ThemeMode.system,
///   home: MyApp(),
/// )
/// ```
class O1Theme {
  O1Theme._();

  /// Light theme configuration
  static ThemeData get lightTheme => getLightTheme();

  /// Dark theme configuration
  static ThemeData get darkTheme => getDarkTheme();
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../tokens/borders.dart';
import '../../tokens/sizes.dart';
import '../../tokens/typography.dart';
import 'semantic_colors_dark.dart';

/// Dark theme configuration for O1 Design System
ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // Color Scheme
    colorScheme: const ColorScheme.dark(
      primary: O1SemanticColorsDark.buttonPrimaryBackground,
      onPrimary: O1SemanticColorsDark.buttonPrimaryText,
      secondary: O1SemanticColorsDark.buttonPrimaryBackground,
      onSecondary: O1SemanticColorsDark.buttonPrimaryText,
      error: O1SemanticColorsDark.inputBorderError,
      surface: O1SemanticColorsDark.surfaceCard,
      onSurface: O1SemanticColorsDark.textPrimary,
    ),

    // Typography
    textTheme: O1Typography.getTextTheme(
      textPrimary: O1SemanticColorsDark.textPrimary,
      textSecondary: O1SemanticColorsDark.textSecondary,
      textDisabled: O1SemanticColorsDark.textDisabled,
    ),

    // ElevatedButton Theme (Primary Button)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return O1SemanticColorsDark.buttonDisabledBackground;
          }
          return O1SemanticColorsDark.buttonPrimaryBackground;
        }),
        foregroundColor: WidgetStateProperty.all(
          O1SemanticColorsDark.buttonPrimaryText,
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.white.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.focused)) {
            return Colors.white.withValues(alpha: 0.2);
          }
          if (states.contains(WidgetState.pressed)) {
            return Colors.white.withValues(alpha: 0.3);
          }
          return null;
        }),
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, O1Sizes.buttonHeightDefault),
        ),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
          ),
        ),
        elevation: WidgetStateProperty.all(0),
      ),
    ),

    // OutlinedButton Theme (Secondary Button)
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return O1SemanticColorsDark.buttonDisabledText;
          }
          return O1SemanticColorsDark.buttonSecondaryText;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(WidgetState.disabled)) {
            return const BorderSide(
              color: O1SemanticColorsDark.buttonDisabledBackground,
              width: O1Borders.o1BorderWidth,
            );
          }
          return const BorderSide(
            color: O1SemanticColorsDark.buttonSecondaryBorder,
            width: O1Borders.o1BorderWidth,
          );
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return O1SemanticColorsDark.buttonSecondaryText.withValues(
              alpha: 0.1,
            );
          }
          if (states.contains(WidgetState.focused)) {
            return O1SemanticColorsDark.buttonSecondaryText.withValues(
              alpha: 0.2,
            );
          }
          if (states.contains(WidgetState.pressed)) {
            return O1SemanticColorsDark.buttonSecondaryText.withValues(
              alpha: 0.3,
            );
          }
          return null;
        }),
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, O1Sizes.buttonHeightDefault),
        ),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
          ),
        ),
      ),
    ),

    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return O1SemanticColorsDark.buttonDisabledText;
          }
          return O1SemanticColorsDark.buttonTextColor;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return O1SemanticColorsDark.buttonTextColor.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.focused)) {
            return O1SemanticColorsDark.buttonTextColor.withValues(alpha: 0.2);
          }
          if (states.contains(WidgetState.pressed)) {
            return O1SemanticColorsDark.buttonTextColor.withValues(alpha: 0.3);
          }
          return null;
        }),
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, O1Sizes.buttonHeightDefault),
        ),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
          ),
        ),
      ),
    ),

    // InputDecoration Theme
    inputDecorationTheme: InputDecorationTheme(
      // Default state
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColorsDark.inputBorderDefault,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColorsDark.inputBorderFocus,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      // Error state
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColorsDark.inputBorderError,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColorsDark.inputBorderError,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      // Disabled state
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColorsDark.inputBorderDefault,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      fillColor: O1SemanticColorsDark.inputBackgroundDefault,
      filled: true,
      labelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColorsDark.inputLabelDefault,
      ),
      floatingLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColorsDark.inputLabelDefault,
      ),
      hintStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: O1SemanticColorsDark.inputTextPlaceholder,
      ),
      errorStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColorsDark.inputLabelError,
      ),
      helperStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColorsDark.inputHelperTextDefault,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hoverColor: O1SemanticColorsDark.inputBorderFocus.withValues(alpha: 0.02),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: O1SemanticColorsDark.surfaceBackground,
      foregroundColor: O1SemanticColorsDark.textPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: O1SemanticColorsDark.textPrimary,
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: O1SemanticColorsDark.surfaceCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        side: const BorderSide(
          color: O1SemanticColorsDark.surfaceBorder,
          width: O1Borders.o1BorderWidth,
        ),
      ),
    ),

    scaffoldBackgroundColor: O1SemanticColorsDark.surfaceBackground,
  );
}

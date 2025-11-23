import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../tokens/borders.dart';
import '../../tokens/sizes.dart';
import '../../tokens/typography.dart';
import 'semantic_colors.dart';

/// Light theme configuration for O1 Design System
ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: O1SemanticColors.buttonPrimaryBackground,
      onPrimary: O1SemanticColors.buttonPrimaryText,
      secondary: O1SemanticColors.buttonPrimaryBackground,
      onSecondary: O1SemanticColors.buttonPrimaryText,
      error: O1SemanticColors.inputBorderError,
      surface: O1SemanticColors.surfaceBackground,
      onSurface: O1SemanticColors.textPrimary,
    ),

    // Typography
    textTheme: O1Typography.getTextTheme(
      textPrimary: O1SemanticColors.textPrimary,
      textSecondary: O1SemanticColors.textSecondary,
      textDisabled: O1SemanticColors.textDisabled,
    ),

    // ElevatedButton Theme (Primary Button)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return O1SemanticColors.buttonDisabledBackground;
          }
          return O1SemanticColors.buttonPrimaryBackground;
        }),
        foregroundColor: WidgetStateProperty.all(
          O1SemanticColors.buttonPrimaryText,
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
            return O1SemanticColors.buttonDisabledText;
          }
          return O1SemanticColors.buttonSecondaryText;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        side: WidgetStateProperty.resolveWith<BorderSide>((states) {
          if (states.contains(WidgetState.disabled)) {
            return const BorderSide(
              color: O1SemanticColors.buttonDisabledBackground,
              width: O1Borders.o1BorderWidth,
            );
          }
          return const BorderSide(
            color: O1SemanticColors.buttonSecondaryBorder,
            width: O1Borders.o1BorderWidth,
          );
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return O1SemanticColors.buttonSecondaryText.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.focused)) {
            return O1SemanticColors.buttonSecondaryText.withValues(alpha: 0.2);
          }
          if (states.contains(WidgetState.pressed)) {
            return O1SemanticColors.buttonSecondaryText.withValues(alpha: 0.3);
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
            return O1SemanticColors.buttonDisabledText;
          }
          return O1SemanticColors.buttonTextColor;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.hovered)) {
            return O1SemanticColors.buttonTextColor.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.focused)) {
            return O1SemanticColors.buttonTextColor.withValues(alpha: 0.2);
          }
          if (states.contains(WidgetState.pressed)) {
            return O1SemanticColors.buttonTextColor.withValues(alpha: 0.3);
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
          color: O1SemanticColors.inputBorderDefault,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColors.inputBorderFocus,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      // Error state
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColors.inputBorderError,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColors.inputBorderError,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      // Disabled state
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        borderSide: const BorderSide(
          color: O1SemanticColors.inputBorderDefault,
          width: O1Borders.o1BorderWidth,
        ),
      ),
      fillColor: O1SemanticColors.inputBackgroundDefault,
      filled: true,
      labelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColors.inputLabelDefault,
      ),
      floatingLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColors.inputLabelDefault,
      ),
      hintStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: O1SemanticColors.inputTextPlaceholder,
      ),
      errorStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColors.inputLabelError,
      ),
      helperStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: O1SemanticColors.inputHelperTextDefault,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hoverColor: O1SemanticColors.inputBorderFocus.withValues(alpha: 0.02),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: O1SemanticColors.surfaceBackground,
      foregroundColor: O1SemanticColors.textPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: O1SemanticColors.textPrimary,
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: O1SemanticColors.surfaceCard,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(O1Borders.o1BorderRadius8),
        side: const BorderSide(
          color: O1SemanticColors.surfaceBorder,
          width: O1Borders.o1BorderWidth,
        ),
      ),
    ),
  );
}

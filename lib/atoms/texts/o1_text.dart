import 'package:flutter/material.dart';

/// Text style variants for O1Text component
enum O1TextStyle {
  /// Display large - 32px bold
  displayLarge,

  /// Display medium - 24px bold
  displayMedium,

  /// Display small - 16px bold
  displaySmall,

  /// Headline large - 32px bold
  headlineLarge,

  /// Headline medium - 24px bold
  headlineMedium,

  /// Headline small - 16px bold
  headlineSmall,

  /// Title large - 24px bold
  titleLarge,

  /// Title medium - 16px bold
  titleMedium,

  /// Title small - 18px w500
  titleSmall,

  /// Body large - 18px w500
  bodyLarge,

  /// Body medium - 14px normal
  bodyMedium,

  /// Body small - 12px normal
  bodySmall,

  /// Label large - 16px bold
  labelLarge,

  /// Label medium - 14px normal
  labelMedium,

  /// Label small - 10px w500
  labelSmall,
}

/// O1 Design System Text Component
///
/// A text component that uses the theme's text styles from the O1 design system.
///
/// Example:
/// ```dart
/// O1Text(
///   'Hello World',
///   style: O1TextStyle.headlineMedium,
///   color: Colors.blue,
/// )
/// ```
class O1Text extends StatelessWidget {
  /// The text to display
  final String text;

  /// The text style variant to use
  final O1TextStyle style;

  /// Optional color override
  final Color? color;

  /// Text alignment
  final TextAlign? textAlign;

  /// Maximum number of lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow? overflow;

  /// Font weight override
  final FontWeight? fontWeight;

  /// Font size override
  final double? fontSize;

  const O1Text(
    this.text, {
    super.key,
    this.style = O1TextStyle.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
  });

  TextStyle? _getTextStyle(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    TextStyle? baseStyle;
    switch (style) {
      case O1TextStyle.displayLarge:
        baseStyle = theme.displayLarge;
        break;
      case O1TextStyle.displayMedium:
        baseStyle = theme.displayMedium;
        break;
      case O1TextStyle.displaySmall:
        baseStyle = theme.displaySmall;
        break;
      case O1TextStyle.headlineLarge:
        baseStyle = theme.headlineLarge;
        break;
      case O1TextStyle.headlineMedium:
        baseStyle = theme.headlineMedium;
        break;
      case O1TextStyle.headlineSmall:
        baseStyle = theme.headlineSmall;
        break;
      case O1TextStyle.titleLarge:
        baseStyle = theme.titleLarge;
        break;
      case O1TextStyle.titleMedium:
        baseStyle = theme.titleMedium;
        break;
      case O1TextStyle.titleSmall:
        baseStyle = theme.titleSmall;
        break;
      case O1TextStyle.bodyLarge:
        baseStyle = theme.bodyLarge;
        break;
      case O1TextStyle.bodyMedium:
        baseStyle = theme.bodyMedium;
        break;
      case O1TextStyle.bodySmall:
        baseStyle = theme.bodySmall;
        break;
      case O1TextStyle.labelLarge:
        baseStyle = theme.labelLarge;
        break;
      case O1TextStyle.labelMedium:
        baseStyle = theme.labelMedium;
        break;
      case O1TextStyle.labelSmall:
        baseStyle = theme.labelSmall;
        break;
    }

    return baseStyle?.copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(context),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

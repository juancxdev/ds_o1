import 'package:flutter/material.dart';
import '../../tokens/sizes.dart';
import '../buttons/o1_button.dart';

/// Prefix configuration for O1TextField
///
/// Only allows an icon button with tooltip to display important information to the user.
class O1TextFieldPrefix {
  /// The widget to display as prefix
  final Widget widget;

  const O1TextFieldPrefix._({required this.widget});

  /// Creates a prefix with an icon button and tooltip
  ///
  /// Used to show important information to the user when tapped/hovered.
  ///
  /// Example:
  /// ```dart
  /// O1TextFieldPrefix.iconWithTooltip(
  ///   icon: Icons.info_outline,
  ///   tooltip: 'Enter your phone number with country code',
  /// )
  /// ```
  factory O1TextFieldPrefix.iconWithTooltip({
    required IconData icon,
    required String tooltip,
  }) {
    return O1TextFieldPrefix._(
      widget: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return Tooltip(
            message: tooltip,
            child: Icon(
              icon,
              size: 20,
              color: theme.inputDecorationTheme.hintStyle?.color ??
                  theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          );
        },
      ),
    );
  }
}

/// Suffix configuration for O1TextField
///
/// Provides two types of suffix buttons:
/// - [iconButton]: For toggle actions like show/hide password
/// - [button]: Small text button for actions like sending OTP codes
class O1TextFieldSuffix {
  /// The widget to display as suffix
  final Widget widget;

  /// If true, uses `suffix` instead of `suffixIcon` in InputDecoration
  final bool isButton;

  const O1TextFieldSuffix._({required this.widget, this.isButton = false});

  /// Creates a suffix with an icon button
  ///
  /// Ideal for toggle actions like showing/hiding password.
  ///
  /// Example:
  /// ```dart
  /// O1TextFieldSuffix.iconButton(
  ///   icon: Icons.visibility,
  ///   onPressed: () => togglePasswordVisibility(),
  /// )
  /// ```
  factory O1TextFieldSuffix.iconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return O1TextFieldSuffix._(
      widget: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return IconButton(
            icon: Icon(icon, size: 20),
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            color: theme.inputDecorationTheme.hintStyle?.color ??
                theme.colorScheme.onSurface.withValues(alpha: 0.6),
          );
        },
      ),
    );
  }

  /// Creates a suffix with a small text button
  ///
  /// Ideal for actions like sending OTP codes.
  ///
  /// Example:
  /// ```dart
  /// O1TextFieldSuffix.button(
  ///   text: 'Send',
  ///   onPressed: () => sendOtpCode(),
  /// )
  /// ```
  factory O1TextFieldSuffix.button({
    required String text,
    required VoidCallback onPressed,
  }) {
    return O1TextFieldSuffix._(
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: O1Button(
          text: text,
          onPressed: onPressed,
          type: O1ButtonType.primary,
          size: O1ButtonSize.small,
        ),
      ),
      isButton: true,
    );
  }
}

/// O1 Design System TextField Component
///
/// A customizable text field component that follows the O1 design system specifications.
/// Supports different states (enabled, disabled, readonly, error) with restricted prefix/suffix options.
///
/// Prefix: Only allows an icon with tooltip for showing important information.
/// Suffix: Only allows iconButton (for toggles) or button (for actions like OTP).
///
/// Example with password toggle:
/// ```dart
/// O1TextField(
///   label: 'Password',
///   placeholder: 'Enter your password',
///   obscureText: true,
///   suffix: O1TextFieldSuffix.iconButton(
///     icon: Icons.visibility,
///     onPressed: () => togglePasswordVisibility(),
///   ),
/// )
/// ```
///
/// Example with OTP button:
/// ```dart
/// O1TextField(
///   label: 'Phone',
///   placeholder: 'Enter your phone',
///   prefix: O1TextFieldPrefix.iconWithTooltip(
///     icon: Icons.info_outline,
///     tooltip: 'Include country code',
///   ),
///   suffix: O1TextFieldSuffix.button(
///     text: 'Send OTP',
///     onPressed: () => sendOtp(),
///   ),
/// )
/// ```
class O1TextField extends StatelessWidget {
  /// Placeholder text to display when the field is empty
  final String? placeholder;

  /// Label text to display above the field
  final String? label;

  /// Whether the field is enabled (default: true)
  final bool enabled;

  /// Whether the field is read-only (default: false)
  final bool readOnly;

  /// Flexible suffix widget configuration
  final O1TextFieldSuffix? suffix;

  /// Text editing controller for the field
  final TextEditingController? controller;

  /// Validator function for form validation
  final String? Function(String?)? validator;

  /// Callback when the text changes
  final ValueChanged<String>? onChanged;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Keyboard type for the text field
  final TextInputType? keyboardType;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of text
  final int? maxLength;

  /// Helper text to display below the field
  final String? helperText;

  /// Error text to display (overrides validator)
  final String? errorText;

  /// Prefix configuration with icon and tooltip
  final O1TextFieldPrefix? prefix;

  /// Whether the field is required (shows red asterisk)
  final bool required;

  const O1TextField({
    super.key,
    this.placeholder,
    this.label,
    this.enabled = true,
    this.readOnly = false,
    this.suffix,
    this.controller,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.helperText,
    this.errorText,
    this.prefix,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    // Suffix widget (already has its own onPressed handlers)
    final suffixWidget = suffix?.widget;

    // Prefix widget
    final prefixWidget = prefix?.widget;

    // Get theme styles
    final inputTheme = Theme.of(context).inputDecorationTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Build label widget (separate from input, as per Figma)
    Widget? labelWidget;
    if (label != null) {
      // Determine label color based on state - use theme colors
      final labelColor = !enabled
          ? inputTheme.labelStyle?.color?.withValues(alpha: 0.5) ??
              colorScheme.onSurface.withValues(alpha: 0.38)
          : errorText != null
              ? colorScheme.error
              : inputTheme.labelStyle?.color ?? colorScheme.onSurface;

      labelWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label!,
            style: inputTheme.labelStyle?.copyWith(color: labelColor),
          ),
          if (required) ...[
            const SizedBox(width: 4),
            Text(
              '*',
              style: inputTheme.labelStyle?.copyWith(
                color: colorScheme.error,
              ),
            ),
          ],
        ],
      );
    }

    return Opacity(
      opacity: !enabled ? 0.5 : 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label (outside of input, as per Figma)
          if (labelWidget != null) ...[labelWidget, const SizedBox(height: 12)],
          // Input field
          TextFormField(
            controller: controller,
            enabled: enabled,
            readOnly: readOnly,
            validator: validator,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: obscureText ? 1 : maxLines,
            minLines: minLines,
            maxLength: maxLength,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: colorScheme.onSurface,
                ),
            decoration: InputDecoration(
              hintText: placeholder,
              suffixIcon: suffixWidget,
              suffixIconConstraints: suffix?.isButton == true
                  ? const BoxConstraints()
                  : null,
              prefixIcon: prefixWidget,
              // Don't override fillColor - let theme handle it
              // Only override if disabled to apply reduced opacity
              fillColor: !enabled
                  ? (inputTheme.fillColor ?? colorScheme.surface)
                      .withValues(alpha: 0.5)
                  : null,
              constraints: maxLines == 1
                  ? BoxConstraints.tightFor(height: O1Sizes.inputHeight)
                  : BoxConstraints(minHeight: O1Sizes.inputHeight),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              isDense: false,
              counterText: '',
              errorText: errorText != null ? '' : null,
              errorStyle: const TextStyle(height: 0, fontSize: 0),
              helperText: null,
            ),
          ),
          // Helper/Error text and counter (outside of input, as per Figma)
          if (errorText != null || helperText != null || maxLength != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (errorText != null)
                    Text(errorText!, style: inputTheme.errorStyle)
                  else if (helperText != null)
                    Text(
                      helperText!,
                      style: inputTheme.helperStyle,
                    )
                  else
                    const SizedBox.shrink(),
                  if (maxLength != null)
                    Text(
                      '${controller?.text.length ?? 0}/$maxLength',
                      style: inputTheme.helperStyle,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

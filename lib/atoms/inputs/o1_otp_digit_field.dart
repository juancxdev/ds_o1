import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../foundations/themes/semantic_colors.dart';
import '../../tokens/sizes.dart';

/// O1 Design System OTP Digit Field Atom
///
/// A single digit input field for OTP (One-Time Password) codes.
/// This is a basic building block to be used within OTP input molecules.
///
/// Features:
/// - Responsive sizing (uses Expanded/Flexible)
/// - Configurable enabled/error states
/// - Keyboard event handling
/// - Text obscuring support
/// - Center-aligned text
///
/// Example:
/// ```dart
/// O1OtpDigitField(
///   controller: _controller,
///   focusNode: _focusNode,
///   enabled: true,
///   hasError: false,
///   onChanged: (value) => handleChange(value),
///   onKeyEvent: (event) => handleKeyEvent(event),
/// )
/// ```
class O1OtpDigitField extends StatelessWidget {
  /// Controller for the text field
  final TextEditingController controller;

  /// Focus node for the text field
  final FocusNode focusNode;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether the field has an error
  final bool hasError;

  /// Whether to obscure the text (for sensitive codes)
  final bool obscureText;

  /// Type of keyboard to show (number or text)
  final TextInputType keyboardType;

  /// Callback when the value changes
  final ValueChanged<String> onChanged;

  /// Callback when a key event occurs
  final ValueChanged<KeyEvent> onKeyEvent;

  const O1OtpDigitField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onKeyEvent,
    this.enabled = true,
    this.hasError = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTheme = theme.inputDecorationTheme;

    return SizedBox(
      height: O1Sizes.inputHeight,
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: onKeyEvent,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            if (keyboardType == TextInputType.number)
              FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            counterText: '',
            contentPadding: const EdgeInsets.all(0),
            enabledBorder: hasError
                ? inputTheme.errorBorder
                : inputTheme.enabledBorder,
            focusedBorder: hasError
                ? inputTheme.focusedErrorBorder
                : inputTheme.focusedBorder,
            errorBorder: inputTheme.errorBorder,
            focusedErrorBorder: inputTheme.focusedErrorBorder,
            disabledBorder: inputTheme.disabledBorder,
            filled: true,
            fillColor: !enabled
                ? O1SemanticColors.inputBackgroundDisabled
                : O1SemanticColors.inputBackgroundDefault,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

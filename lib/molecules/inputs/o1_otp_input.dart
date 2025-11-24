import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../atoms/inputs/o1_otp_digit_field.dart';
import '../../foundations/themes/semantic_colors.dart';

/// O1 Design System OTP Input Molecule
///
/// A specialized input component for One-Time Password (OTP) codes.
/// Displays multiple individual input fields, one for each digit.
///
/// Features:
/// - Auto-focus to next field on input
/// - Auto-focus to previous field on backspace
/// - Paste support for the entire code
/// - Error state visualization
/// - Completion callback
/// - Customizable length (4, 5, 6 digits, etc.)
///
/// Example:
/// ```dart
/// O1OtpInput(
///   length: 6,
///   onCompleted: (code) {
///     print('OTP Code entered: $code');
///     verifyCode(code);
///   },
///   onChanged: (value) {
///     print('Current value: $value');
///   },
/// )
/// ```
class O1OtpInput extends StatefulWidget {
  /// Number of OTP digits (default: 6)
  final int length;

  /// Callback when all digits are entered
  final ValueChanged<String>? onCompleted;

  /// Callback when any digit changes
  final ValueChanged<String>? onChanged;

  /// Whether to show error state
  final bool hasError;

  /// Error message to display below
  final String? errorText;

  /// Helper text to display below
  final String? helperText;

  /// Label text to display above
  final String? label;

  /// Whether the input is enabled
  final bool enabled;

  /// Whether the field is required (shows red asterisk)
  final bool required;

  /// Whether to obscure the text (for sensitive codes)
  final bool obscureText;

  /// Type of keyboard to show (number or text)
  final TextInputType keyboardType;

  const O1OtpInput({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.onChanged,
    this.hasError = false,
    this.errorText,
    this.helperText,
    this.label,
    this.enabled = true,
    this.required = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.number,
  });

  @override
  State<O1OtpInput> createState() => _O1OtpInputState();
}

class _O1OtpInputState extends State<O1OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (index) => FocusNode(),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _currentValue {
    return _controllers.map((c) => c.text).join();
  }

  void _notifyChange() {
    final value = _currentValue;
    widget.onChanged?.call(value);

    if (value.length == widget.length) {
      widget.onCompleted?.call(value);
    }
  }

  void _handlePaste(String pastedText) {
    // Clean the pasted text (remove spaces, dashes, etc.)
    final cleanText = pastedText.replaceAll(RegExp(r'[^0-9a-zA-Z]'), '');

    // Fill the controllers with the pasted text
    for (int i = 0; i < widget.length && i < cleanText.length; i++) {
      _controllers[i].text = cleanText[i];
    }

    // Focus the next empty field or the last field
    final nextEmptyIndex = _controllers.indexWhere((c) => c.text.isEmpty);
    if (nextEmptyIndex != -1) {
      _focusNodes[nextEmptyIndex].requestFocus();
    } else {
      _focusNodes[widget.length - 1].requestFocus();
    }

    _notifyChange();
  }

  void _handleTextChange(int index, String value) {
    if (value.length > 1) {
      // Handle paste
      _handlePaste(value);
      return;
    }

    if (value.isNotEmpty) {
      // Move to next field if available
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // Last field, unfocus to hide keyboard
        _focusNodes[index].unfocus();
      }
    }

    _notifyChange();
  }

  void _handleKeyEvent(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        // Move to previous field if current is empty
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputTheme = Theme.of(context).inputDecorationTheme;

    // Build label widget
    Widget? labelWidget;
    if (widget.label != null) {
      final labelColor = !widget.enabled
          ? O1SemanticColors.inputLabelDisabled
          : widget.hasError || widget.errorText != null
              ? O1SemanticColors.inputLabelError
              : inputTheme.labelStyle?.color ??
                  O1SemanticColors.inputLabelDefault;

      labelWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.label!,
            style: inputTheme.labelStyle?.copyWith(color: labelColor),
          ),
          if (widget.required) ...[
            const SizedBox(width: 4),
            Text(
              '*',
              style: inputTheme.labelStyle?.copyWith(
                color: O1SemanticColors.inputRequiredIndicator,
              ),
            ),
          ],
        ],
      );
    }

    return Opacity(
      opacity: !widget.enabled ? 0.5 : 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label
          if (labelWidget != null) ...[
            labelWidget,
            const SizedBox(height: 12),
          ],

          // OTP Fields
          Row(
            children: List.generate(widget.length, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < widget.length - 1 ? 12 : 0,
                  ),
                  child: O1OtpDigitField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    enabled: widget.enabled,
                    hasError: widget.hasError || widget.errorText != null,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    onChanged: (value) => _handleTextChange(index, value),
                    onKeyEvent: (event) => _handleKeyEvent(index, event),
                  ),
                ),
              );
            }),
          ),

          // Helper/Error text
          if (widget.errorText != null || widget.helperText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: widget.errorText != null
                  ? Text(widget.errorText!, style: inputTheme.errorStyle)
                  : Text(
                      widget.helperText!,
                      style: inputTheme.helperStyle?.copyWith(
                        color: !widget.enabled
                            ? O1SemanticColors.inputHelperTextDisabled
                            : O1SemanticColors.inputHelperTextDefault,
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../tokens/sizes.dart';

/// Button type enum for O1Button
enum O1ButtonType {
  /// Primary button style with filled background
  primary,

  /// Secondary button style with outline
  secondary,

  /// Text button style with no background or border
  text,
}

/// Button size enum for O1Button
enum O1ButtonSize {
  /// Large button - 56px height
  large,

  /// Medium button - 48px height (default)
  medium,

  /// Small button - 32px height
  small,
}

/// O1 Design System Button Component
///
/// A customizable button component that follows the O1 design system specifications.
///
/// Example:
/// ```dart
/// O1Button(
///   text: 'Create Credential',
///   onPressed: () => print('Button pressed'),
///   type: O1ButtonType.primary,
///   size: O1ButtonSize.medium,
/// )
/// ```
class O1Button extends StatelessWidget {
  /// The text to display on the button (required)
  final String text;

  /// Callback function when button is pressed (null = disabled)
  final VoidCallback? onPressed;

  /// Button type: primary, secondary, or text
  final O1ButtonType type;

  /// Button size: large, medium, or small
  final O1ButtonSize size;

  /// Optional icon to display alongside text
  final Widget? icon;

  /// Whether the button is in loading state
  final bool isLoading;

  const O1Button({
    super.key,
    required this.text,
    this.onPressed,
    this.type = O1ButtonType.primary,
    this.size = O1ButtonSize.medium,
    this.icon,
    this.isLoading = false,
  });

  double _getButtonHeight() {
    switch (size) {
      case O1ButtonSize.large:
        return O1Sizes.buttonHeightLarge;
      case O1ButtonSize.medium:
        return O1Sizes.buttonHeightDefault;
      case O1ButtonSize.small:
        return O1Sizes.buttonHeightSmall;
    }
  }

  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == O1ButtonType.primary
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: 8),
          Text(text),
        ],
      );
    }

    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    final buttonContent = _buildButtonContent(context);
    final height = _getButtonHeight();

    // Common button style to prevent infinite width constraints
    final commonStyle = ButtonStyle(
      minimumSize: WidgetStateProperty.all(Size(0, height)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    switch (type) {
      case O1ButtonType.primary:
        return SizedBox(
          height: height,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: commonStyle,
            child: buttonContent,
          ),
        );

      case O1ButtonType.secondary:
        return SizedBox(
          height: height,
          child: OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: commonStyle,
            child: buttonContent,
          ),
        );

      case O1ButtonType.text:
        return SizedBox(
          height: height,
          child: TextButton(
            onPressed: isLoading ? null : onPressed,
            style: commonStyle,
            child: buttonContent,
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';

/// Icon size variants for O1Icon component
enum O1IconSize {
  /// Small icon - 16px
  small,

  /// Medium icon - 24px (default)
  medium,

  /// Large icon - 32px
  large,

  /// Extra large icon - 48px
  extraLarge,
}

/// O1 Design System Icon Component
///
/// A simple icon wrapper that provides consistent sizing and theming.
///
/// Example:
/// ```dart
/// O1Icon(
///   Icons.phone,
///   size: O1IconSize.medium,
///   color: Colors.blue,
/// )
/// ```
class O1Icon extends StatelessWidget {
  /// The icon data to display
  final IconData icon;

  /// The size variant of the icon
  final O1IconSize size;

  /// Optional color override
  final Color? color;

  const O1Icon(
    this.icon, {
    super.key,
    this.size = O1IconSize.medium,
    this.color,
  });

  double _getIconSize() {
    switch (size) {
      case O1IconSize.small:
        return 16.0;
      case O1IconSize.medium:
        return 24.0;
      case O1IconSize.large:
        return 32.0;
      case O1IconSize.extraLarge:
        return 48.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: _getIconSize(),
      color: color ?? Theme.of(context).iconTheme.color,
    );
  }
}

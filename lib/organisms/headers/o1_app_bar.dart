import 'package:flutter/material.dart';

/// O1 Design System AppBar Component
///
/// A customizable app bar that follows the O1 design system specifications.
/// Uses theme configuration for colors and typography.
///
/// Example:
/// ```dart
/// O1AppBar(
///   title: 'My App',
///   leading: Icon(Icons.menu),
///   actions: [
///     IconButton(
///       icon: Icon(Icons.search),
///       onPressed: () => print('Search'),
///     ),
///   ],
/// )
/// ```
class O1AppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Title text or widget
  final Widget? title;

  /// Leading widget (typically a menu icon or back button)
  final Widget? leading;

  /// Action widgets displayed on the right side
  final List<Widget>? actions;

  /// Whether to show the back button automatically
  final bool automaticallyImplyLeading;

  /// Background color override
  final Color? backgroundColor;

  /// Foreground color override
  final Color? foregroundColor;

  /// Elevation override
  final double? elevation;

  /// Whether to center the title
  final bool centerTitle;

  /// Bottom widget (typically a TabBar)
  final PreferredSizeWidget? bottom;

  /// Custom toolbar height
  final double? toolbarHeight;

  const O1AppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.centerTitle = false,
    this.bottom,
    this.toolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;

    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? appBarTheme.backgroundColor,
      foregroundColor: foregroundColor ?? appBarTheme.foregroundColor,
      elevation: elevation ?? appBarTheme.elevation,
      centerTitle: centerTitle,
      bottom: bottom,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        (toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0),
      );
}

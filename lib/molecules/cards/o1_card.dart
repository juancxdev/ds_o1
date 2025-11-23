import 'package:flutter/material.dart';
import '../../tokens/spacing.dart';

/// O1 Design System Card Component
///
/// A card component that follows the O1 design system specifications.
/// Uses theme configuration for colors and borders.
///
/// Example:
/// ```dart
/// O1Card(
///   title: 'Card Title',
///   subtitle: 'Card subtitle text',
///   child: Text('Card content'),
///   onTap: () => print('Card tapped'),
/// )
/// ```
class O1Card extends StatelessWidget {
  /// Optional title text
  final String? title;

  /// Optional subtitle text
  final String? subtitle;

  /// Main content of the card
  final Widget? child;

  /// Optional leading widget (typically an icon or image)
  final Widget? leading;

  /// Optional trailing widget (typically an icon or button)
  final Widget? trailing;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Custom padding for the card content
  final EdgeInsetsGeometry? padding;

  /// Elevation of the card
  final double? elevation;

  /// Background color override
  final Color? color;

  /// Border radius override
  final BorderRadius? borderRadius;

  const O1Card({
    super.key,
    this.title,
    this.subtitle,
    this.child,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.elevation,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardTheme = theme.cardTheme;

    Widget? cardContent;

    // Build card header if title or subtitle exists
    if (title != null || subtitle != null || leading != null || trailing != null) {
      cardContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with leading, title/subtitle, and trailing
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: O1Spacing.o1Spacing12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: theme.textTheme.titleMedium,
                      ),
                    if (subtitle != null) ...[
                      const SizedBox(height: O1Spacing.o1Spacing4),
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: O1Spacing.o1Spacing12),
                trailing!,
              ],
            ],
          ),
          // Main content
          if (child != null) ...[
            const SizedBox(height: O1Spacing.o1Spacing16),
            child!,
          ],
        ],
      );
    } else {
      cardContent = child;
    }

    final cardWidget = Card(
      elevation: elevation ?? cardTheme.elevation,
      color: color ?? cardTheme.color,
      shape: borderRadius != null
          ? RoundedRectangleBorder(borderRadius: borderRadius!)
          : cardTheme.shape,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(O1Spacing.o1Spacing16),
        child: cardContent,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ??
            (cardTheme.shape is RoundedRectangleBorder
                ? (cardTheme.shape as RoundedRectangleBorder).borderRadius
                    as BorderRadius?
                : null),
        child: cardWidget,
      );
    }

    return cardWidget;
  }
}

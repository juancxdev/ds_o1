import 'package:flutter/material.dart';

/// Model for items in O1Select component
///
/// Represents a single selectable item with a value and label.
class O1SelectItem<T> {
  /// The value of the item (used internally)
  final T value;

  /// The label to display to the user
  final String label;

  /// Optional leading widget (e.g., icon, avatar)
  final Widget? leading;

  /// Whether this item is enabled
  final bool enabled;

  const O1SelectItem({
    required this.value,
    required this.label,
    this.leading,
    this.enabled = true,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is O1SelectItem &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

/// O1 Design System Select Component
///
/// A dropdown selection component that follows the O1 design system specifications.
/// Uses Flutter's native DropdownButtonFormField for reliability.
///
/// Features:
/// - Single or nullable selection
/// - Custom item rendering with leading widgets
/// - Error and disabled states
/// - Consistent with O1TextField design
///
/// Example:
/// ```dart
/// O1Select<String>(
///   label: 'Producto',
///   placeholder: 'Selecciona un producto',
///   items: [
///     O1SelectItem(value: '1', label: 'Laptop'),
///     O1SelectItem(value: '2', label: 'Mouse'),
///     O1SelectItem(value: '3', label: 'Teclado'),
///   ],
///   value: selectedProduct,
///   onChanged: (value) => setState(() => selectedProduct = value),
/// )
/// ```
class O1Select<T> extends StatelessWidget {
  /// List of items to display in the dropdown
  final List<O1SelectItem<T>> items;

  /// Currently selected value
  final T? value;

  /// Callback when selection changes
  final ValueChanged<T?>? onChanged;

  /// Label text to display above the field
  final String? label;

  /// Placeholder text when no value is selected
  final String? placeholder;

  /// Whether the field is enabled (default: true)
  final bool enabled;

  /// Whether the field is required (shows red asterisk)
  final bool required;

  /// Error message to display
  final String? errorText;

  /// Helper text to display below the field
  final String? helperText;

  /// Whether to show search functionality (not supported with native component)
  final bool searchable;

  /// Maximum height for the dropdown menu
  final double maxMenuHeight;

  const O1Select({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.label,
    this.placeholder,
    this.enabled = true,
    this.required = false,
    this.errorText,
    this.helperText,
    this.searchable = false,
    this.maxMenuHeight = 300,
  });

  @override
  Widget build(BuildContext context) {
    final inputTheme = Theme.of(context).inputDecorationTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Build label widget (separate from input, matching O1TextField)
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
      opacity: enabled ? 1.0 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label (outside of input, as per O1TextField pattern)
          if (labelWidget != null) ...[labelWidget, const SizedBox(height: 12)],
          // Select field
          DropdownButtonFormField<T>(
            value: value,
            decoration: InputDecoration(
              hintText: placeholder,
              // Use theme hintStyle
              hintStyle: inputTheme.hintStyle,
              // Hide native error/helper text (show separately below)
              errorText: errorText != null ? '' : null,
              errorStyle: const TextStyle(height: 0, fontSize: 0),
              helperText: null,
              filled: true,
              // Don't override fillColor - let theme handle it
              // Only override if disabled to apply reduced opacity
              fillColor: !enabled
                  ? (inputTheme.fillColor ?? colorScheme.surface)
                      .withValues(alpha: 0.5)
                  : null,
              // Don't specify borders - let theme handle them
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item.value,
                enabled: item.enabled,
                child: Row(
                  children: [
                    if (item.leading != null) ...[
                      item.leading!,
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 14,
                          color: !item.enabled
                              ? colorScheme.onSurface.withValues(alpha: 0.38)
                              : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: enabled ? onChanged : null,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: inputTheme.hintStyle?.color ??
                  colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            dropdownColor: colorScheme.surface,
            menuMaxHeight: maxMenuHeight,
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.onSurface,
            ),
          ),
          // Helper/Error text (outside of input, matching O1TextField pattern)
          if (errorText != null || helperText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: errorText != null
                  ? Text(errorText!, style: inputTheme.errorStyle)
                  : Text(
                      helperText!,
                      style: inputTheme.helperStyle,
                    ),
            ),
        ],
      ),
    );
  }
}

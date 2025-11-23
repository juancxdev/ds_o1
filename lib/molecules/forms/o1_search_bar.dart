import 'package:flutter/material.dart';
import '../../atoms/inputs/o1_text_field.dart';

/// O1 Design System Search Bar Component
///
/// A search bar component that combines O1TextField with search-specific features.
///
/// Example:
/// ```dart
/// O1SearchBar(
///   placeholder: 'Search...',
///   onChanged: (value) => print('Searching: $value'),
///   onSubmitted: (value) => performSearch(value),
/// )
/// ```
class O1SearchBar extends StatefulWidget {
  /// Placeholder text for the search field
  final String? placeholder;

  /// Initial value for the search field
  final String? initialValue;

  /// Callback when the search text changes
  final ValueChanged<String>? onChanged;

  /// Callback when the user submits the search
  final ValueChanged<String>? onSubmitted;

  /// Callback when the search is cleared
  final VoidCallback? onClear;

  /// Whether to show the clear button
  final bool showClearButton;

  /// Leading icon (defaults to search icon)
  final Widget? leadingIcon;

  /// Whether to autofocus the search field
  final bool autofocus;

  /// Text editing controller
  final TextEditingController? controller;

  /// Keyboard type
  final TextInputType? keyboardType;

  const O1SearchBar({
    super.key,
    this.placeholder = 'Search...',
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.showClearButton = true,
    this.leadingIcon,
    this.autofocus = false,
    this.controller,
    this.keyboardType,
  });

  @override
  State<O1SearchBar> createState() => _O1SearchBarState();
}

class _O1SearchBarState extends State<O1SearchBar> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _clearSearch() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return O1TextField(
      controller: _controller,
      placeholder: widget.placeholder,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      onChanged: widget.onChanged,
      prefix: widget.leadingIcon != null
          ? null
          : O1TextFieldPrefix.iconWithTooltip(
              icon: Icons.search,
              tooltip: 'Search',
            ),
      suffix: widget.showClearButton && _hasText
          ? O1TextFieldSuffix.iconButton(
              icon: Icons.clear,
              onPressed: _clearSearch,
            )
          : null,
    );
  }
}

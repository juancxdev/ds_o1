import 'package:flutter/material.dart';

/// Navigation item for O1NavigationBar
class O1NavigationItem {
  /// Icon to display
  final IconData icon;

  /// Label text
  final String label;

  /// Optional selected icon (if different from icon)
  final IconData? selectedIcon;

  /// Optional badge text
  final String? badge;

  const O1NavigationItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.badge,
  });
}

/// O1 Design System Navigation Bar Component
///
/// A bottom navigation bar that follows the O1 design system specifications.
///
/// Example:
/// ```dart
/// O1NavigationBar(
///   currentIndex: _selectedIndex,
///   onDestinationSelected: (index) {
///     setState(() => _selectedIndex = index);
///   },
///   destinations: [
///     O1NavigationItem(
///       icon: Icons.home,
///       label: 'Home',
///     ),
///     O1NavigationItem(
///       icon: Icons.search,
///       label: 'Search',
///     ),
///     O1NavigationItem(
///       icon: Icons.person,
///       label: 'Profile',
///       badge: '3',
///     ),
///   ],
/// )
/// ```
class O1NavigationBar extends StatelessWidget {
  /// List of navigation items
  final List<O1NavigationItem> destinations;

  /// Currently selected index
  final int currentIndex;

  /// Callback when a destination is selected
  final ValueChanged<int>? onDestinationSelected;

  /// Background color override
  final Color? backgroundColor;

  /// Selected item color override
  final Color? selectedItemColor;

  /// Unselected item color override
  final Color? unselectedItemColor;

  /// Elevation of the navigation bar
  final double? elevation;

  /// Height of the navigation bar
  final double? height;

  const O1NavigationBar({
    super.key,
    required this.destinations,
    required this.currentIndex,
    this.onDestinationSelected,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      elevation: elevation ?? 0,
      height: height,
      destinations: destinations.map((item) {
        return NavigationDestination(
          icon: item.badge != null
              ? Badge(
                  label: Text(item.badge!),
                  child: Icon(item.icon),
                )
              : Icon(item.icon),
          selectedIcon: item.selectedIcon != null
              ? (item.badge != null
                  ? Badge(
                      label: Text(item.badge!),
                      child: Icon(item.selectedIcon!),
                    )
                  : Icon(item.selectedIcon!))
              : null,
          label: item.label,
        );
      }).toList(),
    );
  }
}

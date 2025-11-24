/// O1 Design System Library
///
/// A complete design system for Flutter following Atomic Design methodology.
///
/// Usage:
/// ```dart
/// import 'package:ds_o1/ds_o1.dart';
///
/// MaterialApp(
///   theme: O1Theme.lightTheme,
///   darkTheme: O1Theme.darkTheme,
///   themeMode: ThemeMode.system,
///   home: MyApp(),
/// )
/// ```
library;

// Tokens
export 'tokens/colors.dart';
export 'tokens/typography.dart';
export 'tokens/spacing.dart';
export 'tokens/borders.dart';
export 'tokens/sizes.dart';

// Foundations
export 'foundations/themes/o1_theme.dart';
export 'foundations/themes/light_theme.dart';
export 'foundations/themes/dark_theme.dart';
export 'foundations/themes/semantic_colors.dart';
export 'foundations/themes/semantic_colors_dark.dart';
export 'foundations/themes/theme_extensions.dart';

// Atoms
export 'atoms/buttons/o1_button.dart';
export 'atoms/inputs/o1_text_field.dart';
export 'atoms/inputs/o1_select.dart';
export 'atoms/texts/o1_text.dart';
export 'atoms/icons/o1_icon.dart';

// Molecules
export 'molecules/cards/o1_card.dart';
export 'molecules/forms/o1_search_bar.dart';
export 'molecules/inputs/o1_otp_input.dart';

// Organisms
export 'organisms/headers/o1_app_bar.dart';
export 'organisms/sections/o1_navigation_bar.dart';

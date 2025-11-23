import '../../tokens/colors.dart';

/// Semantic colors for Dark Theme
///
/// These colors have meaning and should be used in components.
/// They reference the base color tokens from O1Colors.
class O1SemanticColorsDark {
  O1SemanticColorsDark._();

  // Text Colors
  /// Primary text color - used for headings and main content
  static const textPrimary = O1Colors.white;

  /// Secondary text color - used for supporting text
  static const textSecondary = O1Colors.gray400;

  /// Disabled text color - used for disabled elements
  static const textDisabled = O1Colors.gray500;

  /// Error text color - used for error messages
  static const textError = O1Colors.error400;

  /// Text color on primary background - typically white
  static const textOnPrimary = O1Colors.white;

  // Button Colors
  /// Primary button background color
  static const buttonPrimaryBackground = O1Colors.primary500;

  /// Primary button text color
  static const buttonPrimaryText = O1Colors.white;

  /// Secondary button border color
  static const buttonSecondaryBorder = O1Colors.primary400;

  /// Secondary button text color
  static const buttonSecondaryText = O1Colors.primary400;

  /// Text button color
  static const buttonTextColor = O1Colors.primary400;

  /// Disabled button background color
  static const buttonDisabledBackground = O1Colors.gray600;

  /// Disabled button text color
  static const buttonDisabledText = O1Colors.gray400;

  // Input Colors
  /// Input border in default state
  static const inputBorderDefault = O1Colors.gray600;

  /// Input border in focus state
  static const inputBorderFocus = O1Colors.primary400;

  /// Input border in error state
  static const inputBorderError = O1Colors.error400;

  /// Input background in default state
  static const inputBackgroundDefault = O1Colors.gray800;

  /// Input background in disabled state
  static const inputBackgroundDisabled = O1Colors.gray700;

  /// Input text color in default state
  static const inputTextDefault = O1Colors.white;

  /// Input text color in disabled state
  static const inputTextDisabled = O1Colors.gray500;

  /// Input placeholder text color
  static const inputTextPlaceholder = O1Colors.gray400;

  /// Input label color in default state
  static const inputLabelDefault = O1Colors.gray300;

  /// Input label color in disabled state
  static const inputLabelDisabled = O1Colors.gray500;

  /// Input label color in error state
  static const inputLabelError = O1Colors.error400;

  /// Input helper text color in default state
  static const inputHelperTextDefault = O1Colors.gray300;

  /// Input helper text color in disabled state
  static const inputHelperTextDisabled = O1Colors.gray500;

  /// Input required indicator color
  static const inputRequiredIndicator = O1Colors.error400;

  // Surface Colors
  /// Main background color
  static const surfaceBackground = O1Colors.black;

  /// Card surface color
  static const surfaceCard = O1Colors.gray900;

  /// Border color for surfaces
  static const surfaceBorder = O1Colors.gray600;
}

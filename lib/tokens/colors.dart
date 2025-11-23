import 'package:flutter/material.dart';

/// Base color tokens (primitives) for the O1 Design System
///
/// These are the raw color values organized in scales.
/// They should not be used directly in components.
/// Use semantic colors from O1SemanticColors instead.
class O1Colors {
  O1Colors._();

  // Primary Palette
  /// Primary color shade 50 - Lightest
  static const Color primary50 = Color(0xFFEFF6FF);

  /// Primary color shade 100
  static const Color primary100 = Color(0xFFDBEAFE);

  /// Primary color shade 200
  static const Color primary200 = Color(0xFFBFDBFE);

  /// Primary color shade 300
  static const Color primary300 = Color(0xFF93C5FD);

  /// Primary color shade 400
  static const Color primary400 = Color(0xFF60A5FA);

  /// Primary color shade 500 - Main primary color
  static const Color primary500 = Color(0xFF1F72FF);

  /// Primary color shade 600
  static const Color primary600 = Color(0xFF1D4ED8);

  /// Primary color shade 700
  static const Color primary700 = Color(0xFF1E40AF);

  /// Primary color shade 800
  static const Color primary800 = Color(0xFF1E3A8A);

  /// Primary color shade 900 - Darkest
  static const Color primary900 = Color(0xFF1E3A8A);

  // Gray Palette (Slate - con tinte azulado)
  /// Gray color shade 50 - Lightest (ideal para backgrounds de cards)
  static const Color gray50 = Color(0xFFF8FAFC);

  /// Gray color shade 100
  static const Color gray100 = Color(0xFFF1F5F9);

  /// Gray color shade 200 (ideal para bordes de cards)
  static const Color gray200 = Color(0xFFE2E8F0);

  /// Gray color shade 300
  static const Color gray300 = Color(0xFFCBD5E1);

  /// Gray color shade 400
  static const Color gray400 = Color(0xFF94A3B8);

  /// Custom placeholder color (between gray400 and gray300)
  static const Color placeholderGray = Color(0xFFADAEBC);

  /// Gray color shade 500 - Middle gray
  static const Color gray500 = Color(0xFF64748B);

  /// Gray color shade 600
  static const Color gray600 = Color(0xFF475569);

  /// Gray color shade 700
  static const Color gray700 = Color(0xFF334155);

  /// Gray color shade 800
  static const Color gray800 = Color(0xFF1E293B);

  /// Gray color shade 900 - Darkest
  static const Color gray900 = Color(0xFF0F172A);

  // Error Palette
  /// Error color shade 50 - Lightest
  static const Color error50 = Color(0xFFFEF2F2);

  /// Error color shade 100
  static const Color error100 = Color(0xFFFEE2E2);

  /// Error color shade 200
  static const Color error200 = Color(0xFFFECACA);

  /// Error color shade 300
  static const Color error300 = Color(0xFFFCA5A5);

  /// Error color shade 400
  static const Color error400 = Color(0xFFF87171);

  /// Error color shade 500 - Main error color
  static const Color error500 = Color(0xFFEF4444);

  /// Error color shade 600
  static const Color error600 = Color(0xFFDC2626);

  /// Error color shade 700
  static const Color error700 = Color(0xFFB91C1C);

  /// Error color shade 800
  static const Color error800 = Color(0xFF991B1B);

  /// Error color shade 900 - Darkest
  static const Color error900 = Color(0xFF7F1D1D);

  // Pure Colors
  /// Pure white
  static const Color white = Color(0xFFFFFFFF);

  /// Pure black
  static const Color black = Color(0xFF0B1222);
}

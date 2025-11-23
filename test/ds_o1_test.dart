import 'package:flutter_test/flutter_test.dart';
import 'package:ds_o1/ds_o1.dart';

void main() {
  group('O1 Design System Tests', () {
    test('O1Colors has correct primary 500 color', () {
      expect(O1Colors.primary500.toARGB32(), 0xFF1F72FF);
    });

    test('O1ButtonType enum has all types', () {
      expect(O1ButtonType.values.length, 3);
      expect(O1ButtonType.values, contains(O1ButtonType.primary));
      expect(O1ButtonType.values, contains(O1ButtonType.secondary));
      expect(O1ButtonType.values, contains(O1ButtonType.text));
    });

    test('O1ButtonSize enum has all sizes', () {
      expect(O1ButtonSize.values.length, 3);
      expect(O1ButtonSize.values, contains(O1ButtonSize.large));
      expect(O1ButtonSize.values, contains(O1ButtonSize.medium));
      expect(O1ButtonSize.values, contains(O1ButtonSize.small));
    });

    test('O1Spacing provides correct values', () {
      expect(O1Spacing.o1Spacing4, 4.0);
      expect(O1Spacing.o1Spacing8, 8.0);
      expect(O1Spacing.o1Spacing16, 16.0);
    });

    test('O1Borders provides correct values', () {
      expect(O1Borders.o1BorderWidth, 1.0);
      expect(O1Borders.o1BorderRadius8, 8.0);
    });
  });
}

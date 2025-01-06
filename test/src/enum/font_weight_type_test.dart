import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FontWeightType Enum Tests', () {
    test('should return correct FontWeight for light', () {
      expect(FontWeightType.light.fontWeight, equals(FontWeight.w300));
    });

    test('should return correct FontWeight for regular', () {
      expect(FontWeightType.regular.fontWeight, equals(FontWeight.w400));
    });

    test('should return correct FontWeight for medium', () {
      expect(FontWeightType.medium.fontWeight, equals(FontWeight.w500));
    });

    test('should return correct FontWeight for semibold', () {
      expect(FontWeightType.semibold.fontWeight, equals(FontWeight.w600));
    });

    test('should have correct number of enum values', () {
      expect(FontWeightType.values.length, equals(4));
    });
  });
}

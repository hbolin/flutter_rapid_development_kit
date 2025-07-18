import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FrdkStringNumberConverter', () {
    group('toIntOrNull', () {
      test('should convert valid integer string to int', () {
        expect('123'.toIntOrNull(), 123);
        expect('-456'.toIntOrNull(), -456);
        expect('0'.toIntOrNull(), 0);
      });

      test('should return null for invalid integer string', () {
        expect('abc'.toIntOrNull(), isNull);
        expect('123.45'.toIntOrNull(), isNull);
        expect(''.toIntOrNull(), isNull);
      });

      test('should handle edge cases for integer conversion', () {
        expect('2147483647'.toIntOrNull(), 2147483647); // max 32-bit int
        expect('-2147483648'.toIntOrNull(), -2147483648); // min 32-bit int
      });
    });

    group('toDoubleOrNull', () {
      test('should convert valid double string to double', () {
        expect('123.45'.toDoubleOrNull(), 123.45);
        expect('-456.78'.toDoubleOrNull(), -456.78);
        expect('0.0'.toDoubleOrNull(), 0.0);
      });

      test('should return null for invalid double string', () {
        expect('abc'.toDoubleOrNull(), isNull);
        expect(''.toDoubleOrNull(), isNull);
        expect('123,45'.toDoubleOrNull(), isNull); // 使用逗号作为小数分隔符
      });

      test('should handle edge cases for double conversion', () {
        expect('1.7976931348623157e+308'.toDoubleOrNull(), double.maxFinite); // max double
        expect('-1.7976931348623157e+308'.toDoubleOrNull(), -double.maxFinite); // min double
      });
    });

    group('toBool', () {
      test('should convert valid boolean string to bool', () {
        expect('true'.toBool(), true);
        expect('TRUE'.toBool(), true);
        expect('false'.toBool(), false);
        expect('FALSE'.toBool(), false);
        expect('0'.toBool(), false);
        expect('no'.toBool(), false);
      });

      test('should handle custom true condition', () {
        expect('yes'.toBool(extraTrueCondition: 'yes'), true);
        expect('YES'.toBool(extraTrueCondition: 'yes'), true);
        expect('true'.toBool(extraTrueCondition: 'yes'), true);
        expect('no'.toBool(extraTrueCondition: 'yes'), false);
      });

      test('should handle edge cases for boolean conversion', () {
        expect(''.toBool(), false); // 空字符串
        expect(' '.toBool(), false); // 空格字符串
        expect('True'.toBool(), true); // 大小写混合
      });

      test('should handle null extraTrueCondition', () {
        expect('true'.toBool(extraTrueCondition: null), true);
        expect('1'.toBool(extraTrueCondition: '1'), true);
        expect('false'.toBool(extraTrueCondition: null), false);
        expect('0'.toBool(extraTrueCondition: null), false);
        expect('no'.toBool(extraTrueCondition: null), false);
      });
    });
  });
}

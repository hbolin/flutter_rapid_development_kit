import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FrdkMoneyDoubleFormat', () {
    test('should format double with default format "0.##"', () {
      expect(3.345.moneyFormat(), '3.35');
      expect(3.40.moneyFormat(), '3.4');
      expect(3.0.moneyFormat(), '3');
    });

    test('should format double with custom format "0.00"', () {
      expect(3.345.moneyFormat(format: '0.00'), '3.35');
      expect(3.40.moneyFormat(format: '0.00'), '3.40');
      expect(3.0.moneyFormat(format: '0.00'), '3.00');
    });

    test('should format double with custom format "#.##"', () {
      expect(3.345.moneyFormat(format: '#.##'), '3.35');
      expect(3.40.moneyFormat(format: '#.##'), '3.4');
      expect(3.0.moneyFormat(format: '#.##'), '3');
    });

    test('should handle edge cases for double formatting', () {
      expect(0.0.moneyFormat(), '0');
      expect((-1.23).moneyFormat(), '-1.23');
      expect(123456789.123456789.moneyFormat(), '123456789.12');
    });
  });

  group('FrdkMoneyStringFormat', () {
    test('should format valid money string with default format "0.##"', () {
      expect('3.345'.moneyFormat(), '3.35');
      expect('3.40'.moneyFormat(), '3.4');
      expect('3.0'.moneyFormat(), '3');
    });

    test('should format valid money string with custom format "0.00"', () {
      expect('3.345'.moneyFormat(format: '0.00'), '3.35');
      expect('3.40'.moneyFormat(format: '0.00'), '3.40');
      expect('3.0'.moneyFormat(format: '0.00'), '3.00');
      expect('.0'.moneyFormat(format: '0.00'), '0.00');
    });

    test('should format valid money string with custom format "#.##"', () {
      expect('3.345'.moneyFormat(format: '#.##'), '3.35');
      expect('3.40'.moneyFormat(format: '#.##'), '3.4');
      expect('3.0'.moneyFormat(format: '#.##'), '3');
    });

    test('should handle edge cases for valid money string formatting', () {
      expect('0.0'.moneyFormat(), '0');
      expect('-1.23'.moneyFormat(), '-1.23');
      expect('123456789.123456789'.moneyFormat(), '123456789.12');
    });

    test('should return null for invalid money string', () {
      expect('abc'.moneyFormat(), isNull);
      expect(''.moneyFormat(), isNull);
      expect('123.abc'.moneyFormat(), isNull);
    });
  });
}

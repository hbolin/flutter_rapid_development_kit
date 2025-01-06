import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('convertT', () {
    test('should return value if it is already of type T', () {
      expect(convertT<int>("42"), 42);
      expect(convertT<String>('hello'), 'hello');
      expect(convertT<bool>(true), true);
    });

    test('should return null if value is null and no default value is provided', () {
      expect(convertT<int>(null), isNull);
      expect(convertT<String>(null), isNull);
      expect(convertT<bool>(null), isNull);
    });

    test('should return default value if value is null and default value is provided', () {
      expect(convertT<int>(null, 10), 10);
      expect(convertT<String>(null, 'default'), 'default');
      expect(convertT<bool>(null, false), false);
    });

    test('should convert string to int', () {
      expect(convertT<int>('42'), 42);
      expect(convertT<int>('0'), 0);
      expect(convertT<int>('-1'), -1);
    });

    test('should return default value if string cannot be converted to int', () {
      expect(convertT<int>('not a number', 10), 10);
    });

    test('should convert string to double', () {
      expect(convertT<double>('3.14'), 3.14);
      expect(convertT<double>('0.0'), 0.0);
      expect(convertT<double>('-1.5'), -1.5);
    });

    test('should return default value if string cannot be converted to double', () {
      expect(convertT<double>('not a number', 0.0), 0.0);
    });

    test('should convert string to bool', () {
      expect(convertT<bool>('true'), true);
      expect(convertT<bool>('false'), false);
      expect(convertT<bool>('1'), true);
      expect(convertT<bool>('0'), false);
    });

    test('should return default value if string cannot be converted to bool', () {
      expect(convertT<bool>('not a bool', false), false);
    });

    test('should convert JSON string to Map', () {
      final jsonString = '{"key": "value"}';
      expect(convertT<Map<String, dynamic>>(jsonString), {'key': 'value'});
    });

    test('should return default value if JSON string is invalid', () {
      final invalidJsonString = 'not a json';
      expect(convertT<Map<String, dynamic>>(invalidJsonString, {'default': 'value'}), {'default': 'value'});
    });

    test('should handle edge cases for bool conversion', () {
      expect(convertT<bool>('True'), true);
      expect(convertT<bool>('False'), false);
      expect(convertT<bool>('TRUE'), true);
      expect(convertT<bool>('FALSE'), false);
    });

    test('should handle edge cases for int conversion', () {
      expect(convertT<int>(' 42 '), 42); // 带空格的字符串
      expect(convertT<int>('42.0', 10), 10); // 带小数点的字符串
    });

    test('should handle edge cases for double conversion', () {
      expect(convertT<double>(' 3.14 '), 3.14); // 带空格的字符串
      expect(convertT<double>('3,14', 0.0), 0.0); // 使用逗号作为小数分隔符
    });
  });
}

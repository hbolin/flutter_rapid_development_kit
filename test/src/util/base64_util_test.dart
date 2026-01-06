import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Base64Util', () {
    group('encryptBase64', () {
      test('should encode a valid string to Base64', () {
        expect(Base64Util.encryptBase64("hello"), "aGVsbG8=");
        expect(Base64Util.encryptBase64("12345"), "MTIzNDU=");
        expect(Base64Util.encryptBase64(""), ""); // 空字符串
      });

      test('should handle special characters', () {
        expect(Base64Util.encryptBase64("!@#\$%^&*()"), "IUAjJCVeJiooKQ==");
      });

      test('should handle Unicode characters', () {
        expect(Base64Util.encryptBase64("你好"), "5L2g5aW9");
      });
    });

    group('decryptBase64', () {
      test('should decode a valid Base64 string', () {
        expect(Base64Util.decryptBase64("aGVsbG8="), "hello");
        expect(Base64Util.decryptBase64("MTIzNDU="), "12345");
        expect(Base64Util.decryptBase64(""), ""); // 空字符串
      });

      test('should throw FormatException for invalid Base64 string', () {
        expect(() => Base64Util.decryptBase64("invalid_base64"), throwsFormatException);
      });

      test('should handle special characters', () {
        expect(Base64Util.decryptBase64("IUAjJCVeJiooKQ=="), "!@#\$%^&*()");
      });

      test('should handle Unicode characters', () {
        expect(Base64Util.decryptBase64("5L2g5aW9"), "你好");
      });
    });
  });
}

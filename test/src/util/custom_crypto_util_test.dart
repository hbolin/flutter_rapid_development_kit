import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomCryptoUtil', () {
    group('encryptBase64', () {
      test('should encode a valid string to Base64', () {
        expect(CustomCryptoUtil.encryptBase64("hello"), "aGVsbG8=");
        expect(CustomCryptoUtil.encryptBase64("12345"), "MTIzNDU=");
        expect(CustomCryptoUtil.encryptBase64(""), ""); // 空字符串
      });

      test('should handle special characters', () {
        expect(CustomCryptoUtil.encryptBase64("!@#\$%^&*()"), "IUAjJCVeJiooKQ==");
      });

      test('should handle Unicode characters', () {
        expect(CustomCryptoUtil.encryptBase64("你好"), "5L2g5aW9");
      });
    });

    group('decryptBase64', () {
      test('should decode a valid Base64 string', () {
        expect(CustomCryptoUtil.decryptBase64("aGVsbG8="), "hello");
        expect(CustomCryptoUtil.decryptBase64("MTIzNDU="), "12345");
        expect(CustomCryptoUtil.decryptBase64(""), ""); // 空字符串
      });

      test('should throw FormatException for invalid Base64 string', () {
        expect(() => CustomCryptoUtil.decryptBase64("invalid_base64"), throwsFormatException);
      });

      test('should handle special characters', () {
        expect(CustomCryptoUtil.decryptBase64("IUAjJCVeJiooKQ=="), "!@#\$%^&*()");
      });

      test('should handle Unicode characters', () {
        expect(CustomCryptoUtil.decryptBase64("5L2g5aW9"), "你好");
      });
    });
  });
}

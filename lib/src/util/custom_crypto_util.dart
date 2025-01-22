import 'dart:convert';

class CustomCryptoUtil {
  /// 自定义Base64 - 加密
  static String encryptBase64(String src) {
    return base64Url.encode(utf8.encode(src));
  }

  /// 自定义Base64 - 解密
  static String decryptBase64(String src) {
    return utf8.decode(base64Url.decode(src));
  }
}

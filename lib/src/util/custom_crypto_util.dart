import 'dart:convert';

class CustomCryptoUtil {
  /// 自定义Base64 - 加密
  static String encryptBase64(String src) {
    // 上面这种会出现问题。不能使用
    // return base64Encode(utf8.encode(src).map((e) => e ^ 0xcc).toList());
    return base64Encode(utf8.encode(src).toList());
  }

  /// 自定义Base64 - 解密
  static String decryptBase64(String src) {
    // 上面这种会出现问题。不能使用
    // return utf8.decode(base64Decode(src).map((e) => e ^ 0xcc).toList());
    return utf8.decode(base64Decode(src).toList());
  }
}

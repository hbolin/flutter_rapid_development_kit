import 'package:flutter/foundation.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:universal_platform/universal_platform.dart';

class LogUtil {
  const LogUtil._();

  static const _tag = "rapid";
  static bool _isLogEnabled = kReleaseMode != true; // 全局日志开关

  /// 启用或禁用日志
  static void enableLog(bool isEnabled) {
    _isLogEnabled = isEnabled;
  }

  /// 打印debug日志
  static void debug(String message, {String tag = _tag}) {
    if (!_isLogEnabled) {
      return;
    }
    if (UniversalPlatform.isAndroid) {
      int maxSize = 512;
      if (message.length > maxSize) {
        final chunks = message.chunk(maxSize);
        for (int i = 0; i < chunks.length; i++) {
          if (i == 0) {
            print('[38;5;39m[${DateTime.now()}] [$tag] ${chunks[i]} [0m');
          } else {
            print('[38;5;39m${chunks[i]} [0m');
          }
        }
      } else {
        print('[38;5;39m[${DateTime.now()}] [$tag] $message [0m');
      }
    } else if (UniversalPlatform.isIOS) {
      debugPrint(message);
    } else {
      debugPrint(message);
    }
  }

  /// 打印error日志
  static void error(String message, {String tag = _tag}) {
    if (!_isLogEnabled) {
      return;
    }
    if (UniversalPlatform.isAndroid) {
      int maxSize = 512;
      if (message.length > maxSize) {
        final chunks = message.chunk(maxSize);
        for (int i = 0; i < chunks.length; i++) {
          if (i == 0) {
            print('[38;5;203m[${DateTime.now()}] [$tag] ${chunks[i]} [0m');
          } else {
            print('[38;5;203m${chunks[i]} [0m');
          }
        }
      } else {
        print('[38;5;203m[${DateTime.now()}] [$tag] $message [0m');
      }
    } else if (UniversalPlatform.isIOS) {
      debugPrint(message);
    } else {
      debugPrint(message);
    }
  }
}

extension _ on String {
  /// 将字符串按指定长度分块
  List<String> chunk([int size = 512]) {
    if (isEmpty) {
      return [];
    }

    final chunks = <String>[];
    for (var i = 0; i < length; i += size) {
      final end = (i + size).clamp(0, length);
      chunks.add(substring(i, end));
    }
    return chunks;
  }
}

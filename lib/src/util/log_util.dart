import 'package:flutter/foundation.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:universal_platform/universal_platform.dart';

class LogUtil {
  const LogUtil._();

  static const _tag = "rapid";
  static bool _isLogEnabled = !kReleaseMode; // 全局日志开关

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
      print('[38;5;39m[${DateTime.now()}] [$tag] $message [0m');
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
      print('[38;5;203m[${DateTime.now()}] [$tag] $message [0m');
    } else if (UniversalPlatform.isIOS) {
      debugPrint(message);
    } else {
      debugPrint(message);
    }
  }
}

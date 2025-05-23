import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:universal_platform/universal_platform.dart';

class LogUtil {
  const LogUtil._();

  static const _tag = "rapid";
  static bool _isLogEnabled = !kReleaseMode; // 全局日志开关

  static final Logger _logger = Logger();

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
      _logger.d(message); // 使用 debug 级别
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
      _logger.e(message); // 使用 error 级别
    } else if (UniversalPlatform.isIOS) {
      log(message, name: tag); // 使用自定义 tag
    } else {
      debugPrint(message);
    }
  }
}

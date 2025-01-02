import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:universal_platform/universal_platform.dart';

class LogUtil {
  const LogUtil._();

  static const _tag = "rapid";

  static final Logger _logger = Logger();

  /// 打印debug日志
  static void debug(String message, {String tag = _tag}) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid) {
      _logger.i(message);
    } else if (UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }

  /// 打印error日志
  /// - [interruptOnDebugModel] 是否在debug模式下中断，默认true
  static void error(String message, {String tag = _tag}) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid) {
      _logger.w(message);
    } else if (UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }
}

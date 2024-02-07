import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_android_log_printer/flutter_android_log_printer.dart';
import 'package:universal_platform/universal_platform.dart';

class LogUtil {
  const LogUtil._();

  static final _flutterAndroidLogPrinterPlugin = FlutterAndroidLogPrinter();

  static const _tag = "rapid";

  /// 打印debug日志
  static void debug(String message, {String tag = _tag}) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid) {
      _flutterAndroidLogPrinterPlugin.logD(tag, message);
    } else if (UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }

  /// 打印error日志
  static void error(String message, {String tag = _tag}) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid) {
      _flutterAndroidLogPrinterPlugin.logE(tag, message);
    } else if (UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }
}

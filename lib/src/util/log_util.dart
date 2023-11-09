import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_android_log_printer/flutter_android_log_printer.dart';
import 'package:universal_platform/universal_platform.dart';

class LogUtil {
  static const tag = "rapid";

  /// 全局配置是否在android打印日志
  static bool configPrintInAndroid = true;

  static final _flutterAndroidLogPrinterPlugin = FlutterAndroidLogPrinter();

  static void debug(String message, {String tag = tag, bool printInAndroid = true}) {
    d(tag, message, printInAndroid: printInAndroid);
  }

  static void error(String message, {String tag = tag, bool printInAndroid = true}) {
    e(tag, message, printInAndroid: printInAndroid);
  }

  static void d(String tag, String message, {bool printInAndroid = true}) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid && configPrintInAndroid && printInAndroid) {
      _flutterAndroidLogPrinterPlugin.logD(tag, message);
    } else if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }

  static void e(String tag, String message, {bool printInAndroid = true}) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid && configPrintInAndroid && printInAndroid) {
      _flutterAndroidLogPrinterPlugin.logE(tag, message);
    } else if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }
}

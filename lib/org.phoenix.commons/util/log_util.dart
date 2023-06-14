import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_android_log_printer/flutter_android_log_printer.dart';

class LogUtil {
  static const tag = "rapid";

  static final _flutterAndroidLogPrinterPlugin = FlutterAndroidLogPrinter();

  /// 全局配置是否在android打印日志
  static bool configPrintInAndroid = true;

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
    if (Platform.isAndroid && configPrintInAndroid && printInAndroid) {
      _flutterAndroidLogPrinterPlugin.logD(tag, message);
    } else {
      log(message, name: tag);
    }
  }

  static void e(String tag, String message, {bool printInAndroid = true}) {
    if (kReleaseMode) {
      return;
    }
    if (Platform.isAndroid && configPrintInAndroid && printInAndroid) {
      _flutterAndroidLogPrinterPlugin.logE(tag, message);
    } else {
      log(message, name: tag);
    }
  }
}

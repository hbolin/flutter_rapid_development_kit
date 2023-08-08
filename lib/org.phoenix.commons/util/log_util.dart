import 'package:flutter/foundation.dart';

class LogUtil {
  static const tag = "rapid";

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
    debugPrint(message);
  }

  static void e(String tag, String message, {bool printInAndroid = true}) {
    if (kReleaseMode) {
      return;
    }
    debugPrint(message);
  }
}

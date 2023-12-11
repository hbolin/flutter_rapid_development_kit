import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';

class LogUtil {
  static const _tag = "rapid";

  static void debug(String message, {String tag = _tag}) {
    d(tag, message);
  }

  static void error(String message, {String tag = _tag}) {
    e(tag, message);
  }

  static void d(String tag, String message) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }

  static void e(String tag, String message) {
    if (kReleaseMode) {
      return;
    }
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      log(message, name: tag);
    } else {
      debugPrint(message);
    }
  }
}

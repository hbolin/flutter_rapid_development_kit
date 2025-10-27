import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:universal_platform/universal_platform.dart';

/// 显示toast工具
class ToastUtil {
  const ToastUtil._();

  static void show(String msg, {bool? isDark}) {
    assert(Get.context != null, "无法获取到Get.context");
    if (Get.context != null && isDark == null) {
      isDark = Theme.of(Get.context!).brightness == Brightness.dark;
      // print("当前是否是Dark Model:$isDark");
    }
    isDark ??= false;
    customShow(
      msg,
      backgroundColor: isDark ? Colors.white : Colors.black,
      textColor: isDark ? Colors.black : Colors.white,
    );
  }

  static void customShow(
    String msg, {
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: UniversalPlatform.isWeb ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}

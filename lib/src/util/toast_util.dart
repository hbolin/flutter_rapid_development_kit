import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

/// 显示toast工具
class ToastUtil {
  const ToastUtil._();

  static void show(String msg, {bool? isDark}) {
    if (Get.context != null && isDark == null) {
      isDark = Theme.of(Get.context!).brightness == Brightness.dark;
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
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}

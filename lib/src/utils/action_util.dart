import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/utils/loading_dialog_util.dart';

class ActionUtil {
  /// 处理Action，显示loading -> 成功
  static Future<bool> dealAction({
    required BuildContext context,
    required Future<dynamic> Function() action,
    @Deprecated("最好不使用onSuccess来处理成功，使用返回值来判断是否成功")
    void Function(dynamic data)? onSuccess,
    void Function(dynamic error)? onFailed,
  }) async {
    bool isSuccess = false;

    try {
      LoadingDialogUtil.show(context);
      var data = await action();
      if (onSuccess != null) {
        onSuccess(data);
      }
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      if (onFailed != null) {
        onFailed(e);
      }
    } finally {
      LoadingDialogUtil.dismiss(context);
    }

    return isSuccess;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/org.phoenix.commons/util/loading_dialog_util.dart';

class ActionUtil {
  /// 处理Action，显示loading -> 成功
  static Future<bool> dealAction({
    required BuildContext context,
    required Future<dynamic> Function() action,
    void Function(dynamic data)? onSuccess,
    void Function(dynamic error)? onFailed,
  }) async {
    bool isSuccess = false;

    try {
      LoadingDialogUtil.show(context);
      var data = await action();
      isSuccess = true;
      if (onSuccess != null) {
        onSuccess(data);
      }
      LoadingDialogUtil.dismiss(context);
    } catch (e) {
      isSuccess = false;
      if (onFailed != null) {
        onFailed(e);
      }
      LoadingDialogUtil.dismiss(context);
    } finally {}

    return isSuccess;
  }
}

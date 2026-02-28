import 'package:flutter_rapid_development_kit/src/util/loading_util.dart';
import 'package:flutter_rapid_development_kit/src/util/toast_util.dart';

class ActionUtil {
  const ActionUtil._();

  /// 默认的失败的实现
  /// 如果自定义了Error，需要重写toString()方法，写出提示的信息。
  static void _onFailed(dynamic error) {
    ToastUtil.show("$error");
  }

  /// 处理Action，显示loading -> 成功
  /// 不允许在action中使用返回的方式，不然Loading Dialog会被关闭
  /// Get.back(); 或者 Navigator.of(context).pop();
  static Future<bool> dealAction({
    required Future<void> Function() action,
    void Function(dynamic error) onFailed = _onFailed,
  }) async {
    bool isSuccess = false;
    try {
      LoadingUtil.showDialog();
      await action();
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
      onFailed(e);
    } finally {
      LoadingUtil.dismissDialog();
    }
    return isSuccess;
  }
}

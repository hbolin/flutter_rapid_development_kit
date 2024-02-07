import 'package:get/get.dart';

/// 核心层错误
/// 所有的更加底层错误，都需要统一成[CoreError]，并交由UI层统一处理
class CoreError {
  static final netError = CoreError(code: 10001, message: 'CoreError_网络异常，请稍后重试'.tr);
  static final netCancel = CoreError(code: 10002, message: 'CoreError_网络请求已取消'.tr);
  static final requestError = CoreError(code: 10003, message: 'CoreError_请求异常'.tr);
  static final serviceError = CoreError(code: 10004, message: 'CoreError_服务异常'.tr);

  final int code;
  final String message;

  CoreError({required this.code, required this.message});

  @override
  String toString() {
    return message;
  }
}

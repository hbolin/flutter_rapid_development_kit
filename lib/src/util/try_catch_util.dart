import 'package:flutter_rapid_development_kit/src/util/log_util.dart';

/// 执行方法的时候捕获异常，让剩下的代码继续执行
/// - [interruptOnDebugModel] 是否在debug模式下中断，默认true
Future<void> tryCatchIgnoreError(Function f, {bool interruptOnDebugModel = true}) async {
  try {
    await f.call();
  } catch (e) {
    LogUtil.error("$e", interruptOnDebugModel: interruptOnDebugModel);
  }
}

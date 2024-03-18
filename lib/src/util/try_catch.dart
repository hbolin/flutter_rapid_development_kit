import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

/// 执行方法的时候捕获异常，让剩下的代码继续执行
void tryCatch(Function f, {bool interruptOnDebugModel = true}) {
  try {
    f.call();
  } catch (e, stack) {
    if (interruptOnDebugModel) {
      assert(false, "执行方式：${f.runtimeType}发生异常，$stack");
    } else {
      LogUtil.error('''
--------------------------------------------------------------------------------------------------------------------------------------------------
执行方式：${f.runtimeType}发生异常：
e:$e 
stack:$stack
--------------------------------------------------------------------------------------------------------------------------------------------------
''');
    }
  }
}

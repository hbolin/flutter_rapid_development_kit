import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_try_catch_page_state.dart';

class TestTryCatchPageLogic extends BasePageGetxController<TestTryCatchPageState> {
  @override
  TestTryCatchPageState initBasePageBaseState() => TestTryCatchPageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    await tryCatchIgnoreError(() async {
      await Future.delayed(const Duration(seconds: 3));
      throw "等待3秒后抛出异常";
    }, interruptOnDebugModel: false);
    await tryCatchIgnoreError(() async {
      await Future.delayed(const Duration(seconds: 3));
      throw "等待3秒后抛出异常";
    }, interruptOnDebugModel: false);
  }
}

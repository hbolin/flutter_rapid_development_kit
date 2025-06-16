import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_base_page_state.dart';

class TestBasePageLogic extends BasePageGetxController<TestBasePageState> {
  @override
  TestBasePageState initBasePageBaseState() => TestBasePageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    await Future.delayed(const Duration(seconds: 2));
    LogUtil.debug("抛出错误");
    throw "error";
  }
}

import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_base_page_route_paras_page_state.dart';

class TestBasePageRouteParasPageLogic extends BasePageGetxController<TestBasePageRouteParasPageState> {
  @override
  TestBasePageRouteParasPageState initBasePageBaseState() => TestBasePageRouteParasPageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    print("获取到的page bookId:${state.page.bookId}");
    print("获取到的page bookId:${state.page.getTag}");
    await Future.delayed(const Duration(seconds: 3));
  }
}

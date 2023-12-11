import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'happy_pay_page_state.dart';

class HappyPayPageLogic extends AppBasePageGetxController {
  final HappyPayPageState state = HappyPayPageState();

  @override
  Future<void> loadData(bool isLoadingCachedData) async {
    // TODO:如果使用到的page的参数，则需要判断page的参数是否合法，因为当前是支持动态路由的，所以无法向原生那样强制要求参数不为null
    if (state.page.pageId == null) {
      throw "parameters error";
    }
  }
}

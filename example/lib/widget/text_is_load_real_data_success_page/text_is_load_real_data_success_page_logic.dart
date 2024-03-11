import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'text_is_load_real_data_success_page_state.dart';

class TextIsLoadRealDataSuccessPageLogic extends BasePageGetxController<TextIsLoadRealDataSuccessPageState> {
  @override
  TextIsLoadRealDataSuccessPageState initBasePageBaseState() => TextIsLoadRealDataSuccessPageState();

  @override
  bool get needLoadCachedData => true;

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    await Future.delayed(const Duration(seconds: 3));
    if (isLoadCachedData == false) {
      throw "加载数据失败";
    }
  }
}

import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'tab2_page_state.dart';

class Tab2PageLogic extends BasePageGetxController<Tab2PageState> {
  @override
  Tab2PageState initBasePageBaseState() => Tab2PageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    await Future.delayed(const Duration(seconds: 5));
  }
}

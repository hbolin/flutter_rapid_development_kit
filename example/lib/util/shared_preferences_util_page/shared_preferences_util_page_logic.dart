import 'package:example/util/shared_preferences_util_page/models/GlobalAppInfo.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'shared_preferences_util_page_state.dart';

class SharedPreferencesUtilPageLogic extends BasePageGetxController<SharedPreferencesUtilPageState> {
  @override
  SharedPreferencesUtilPageState initBasePageBaseState() => SharedPreferencesUtilPageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    // SharedPreferencesUtil.simpleEncryption = false;
    state.globalAppInfo = await SharedPreferencesUtil.getSerializable("key", GlobalAppInfo());
    state.globalAppInfo = GlobalAppInfo(isFirstInstall: false);
  }
}

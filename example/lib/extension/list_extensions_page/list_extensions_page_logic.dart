import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'list_extensions_page_state.dart';

class ListExtensionsPageLogic extends BasePageGetxController<ListExtensionsPageState> {
  @override
  ListExtensionsPageState initBasePageBaseState() => ListExtensionsPageState();

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    for (int i = 0; i < 10; i++) {
      state.list_1.add(Model(i, "list_1_$i"));
    }

    for (int i = 5; i < 15; i++) {
      state.list_2.add(Model(i, "list_2_$i"));
    }
    state.list_2.add(Model(0, "list_2_0"));
  }
}

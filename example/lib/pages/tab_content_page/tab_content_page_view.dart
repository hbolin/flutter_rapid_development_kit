import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'tab_content_page_logic.dart';
import 'tab_content_page_state.dart';

class TabContentPage extends BasePageContentStatefulWidget {
  const TabContentPage({
    super.key,
    super.getTag,
  });

  @override
  State<TabContentPage> createState() => _TabContentPageState();
}

class _TabContentPageState extends BasePageContentState<TabContentPageLogic, TabContentPageState, TabContentPage> {
  @override
  TabContentPageLogic initGetxController() => TabContentPageLogic();

  @override
  Widget buildContent(BuildContext context, TabContentPageLogic logic, bool isCachedData) {
    LogUtil.debug("构建TabContent：${state.page.getTag}");
    return Center(
      child: Text("${state.page.getTag}"),
    );
  }
}

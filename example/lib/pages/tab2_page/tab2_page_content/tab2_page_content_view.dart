import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'tab2_page_content_logic.dart';
import 'tab2_page_content_state.dart';

class Tab2PageContent extends BasePageContentStatefulWidget {
  const Tab2PageContent({
    super.key,
    super.getTag,
  });

  @override
  State<Tab2PageContent> createState() => _Tab2PageContentState();
}

class _Tab2PageContentState extends BasePageContentState<Tab2PageContentLogic, Tab2PageContentState, Tab2PageContent> {
  @override
  Tab2PageContentLogic initGetxController() => Tab2PageContentLogic();

  @override
  Widget buildContent(BuildContext context, Tab2PageContentLogic logic, bool isCachedData) {
    return Center(
      child: Text(
        "Tab2PageContent：${state.page.getTag}",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeightType.semibold.fontWeight,
        ),
      ),
    );
  }
}

import 'package:example/pages/tab_content_page/tab_content_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'tab_page_logic.dart';
import 'tab_page_state.dart';

class TabPage extends BasePageStatefulWidget {
  const TabPage({
    super.key,
    super.getTag,
  });

  factory TabPage.fromRouteParas(Map<String, dynamic> json) => TabPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/tab";

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends BasePageState<TabPageLogic, TabPageState, TabPage> {
  @override
  TabPageLogic initGetxController() => TabPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    // TODO:设置AppBar Title
    return Text("");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, TabPageLogic logic, bool isCachedData) {
    return DefaultTabController(
      length: 20,
      child: Scaffold(
        appBar: AppBar(
          leading: appBarBackButton,
          title: appBarTitle,
          bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: List.generate(20, (index) {
                return "$index";
              }).map((element) {
                return Tab(
                  text: element,
                );
              }).toList()),
        ),
        body: TabBarView(
          children: List.generate(20, (index) {
            return "$index";
          }).map((element) {
            return TabContentPage(
              getTag: element,
            );
          }).toList(),
        ),
      ),
    );
  }
}

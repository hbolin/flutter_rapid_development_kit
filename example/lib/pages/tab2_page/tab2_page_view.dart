import 'package:example/pages/tab2_page/tab2_page_content/tab2_page_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'tab2_page_logic.dart';
import 'tab2_page_state.dart';

class Tab2Page extends BasePageStatefulWidget {
  const Tab2Page({
    super.key,
    super.getTag,
  });

  factory Tab2Page.fromRouteParas(Map<String, dynamic> json) => Tab2Page(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/tab2";

  @override
  State<Tab2Page> createState() => _Tab2PageState();
}

class _Tab2PageState extends BasePageState<Tab2PageLogic, Tab2PageState, Tab2Page> {
  @override
  Tab2PageLogic initGetxController() => Tab2PageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("标题");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, Tab2PageLogic logic, bool isCachedData) {
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
            return Tab2PageContent(
              getTag: element,
            );
          }).toList(),
        ),
      ),
    );
  }
}

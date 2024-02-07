import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_separated_wrap_page_logic.dart';
import 'test_separated_wrap_page_state.dart';

class TestSeparatedWrapPage extends BasePageStatefulWidget {
  const TestSeparatedWrapPage({
    super.key,
    super.getTag,
  });

  factory TestSeparatedWrapPage.fromRouteParas(Map<String, dynamic> json) => TestSeparatedWrapPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_separated_wrap";

  @override
  State<TestSeparatedWrapPage> createState() => _TestSeparatedWrapPageState();
}

class _TestSeparatedWrapPageState extends BasePageState<TestSeparatedWrapPageLogic, TestSeparatedWrapPageState, TestSeparatedWrapPage> {
  @override
  TestSeparatedWrapPageLogic initGetxController() => TestSeparatedWrapPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestSeparatedWrapPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SeparatedWrap(
        itemCount: 100,
        alignment: WrapAlignment.end,
        runAlignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        runSpacing: 20,
        spacing: 10,
        itemBuilder: (BuildContext context, int index) {
          return Text("itemBuilder:$index");
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(width: 10, height: 10, color: Colors.grey);
        },
      ),
    );
  }
}

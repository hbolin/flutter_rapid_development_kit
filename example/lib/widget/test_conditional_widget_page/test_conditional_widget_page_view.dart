import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_conditional_widget_page_logic.dart';
import 'test_conditional_widget_page_state.dart';

class TestConditionalWidgetPage extends BasePageStatefulWidget {
  const TestConditionalWidgetPage({
    super.key,
    super.getTag,
  });

  factory TestConditionalWidgetPage.fromRouteParas(Map<String, dynamic> json) => TestConditionalWidgetPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_conditional_widget";

  @override
  State<TestConditionalWidgetPage> createState() => _TestConditionalWidgetPageState();
}

class _TestConditionalWidgetPageState extends BasePageState<TestConditionalWidgetPageLogic, TestConditionalWidgetPageState, TestConditionalWidgetPage> {
  @override
  TestConditionalWidgetPageLogic initGetxController() => TestConditionalWidgetPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestConditionalWidgetPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const ConditionalWidget(
            isSuccess: true,
            successWidget: Text("成功"),
            failureWidget: Text("失败"),
          ),
          ConditionalBuilder(
            isSuccess: true,
            successBuilder: (BuildContext context) {
              return const Text("成功");
            },
            failureBuilder: (BuildContext context) {
              return const Text("失败");
            },
          ),
        ],
      ),
    );
  }
}

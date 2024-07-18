import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_log_util_page_logic.dart';
import 'test_log_util_page_state.dart';

class TestLogUtilPage extends BasePageStatefulWidget {
  const TestLogUtilPage({
    super.key,
    super.getTag,
  });

  factory TestLogUtilPage.fromRouteParas(Map<String, dynamic> json) => TestLogUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_log_util";

  @override
  State<TestLogUtilPage> createState() => _TestLogUtilPageState();
}

class _TestLogUtilPageState extends BasePageState<TestLogUtilPageLogic, TestLogUtilPageState, TestLogUtilPage> {
  @override
  TestLogUtilPageLogic initGetxController() => TestLogUtilPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestLogUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text("LogUtil"),
          ),
        ],
      ),
    );
  }
}

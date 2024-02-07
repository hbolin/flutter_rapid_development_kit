import 'package:example/error/core_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_action_util_page_logic.dart';
import 'test_action_util_page_state.dart';

class TestActionUtilPage extends BasePageStatefulWidget {
  const TestActionUtilPage({
    super.key,
    super.getTag,
  });

  factory TestActionUtilPage.fromRouteParas(Map<String, dynamic> json) => TestActionUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_action_util";

  @override
  State<TestActionUtilPage> createState() => _TestActionUtilPageState();
}

class _TestActionUtilPageState extends BasePageState<TestActionUtilPageLogic, TestActionUtilPageState, TestActionUtilPage> {
  @override
  TestActionUtilPageLogic initGetxController() => TestActionUtilPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestActionUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              ActionUtil.dealAction(action: () async {
                await Future.delayed(const Duration(seconds: 3));
              });
            },
            child: const Text("ActionUtil.dealAction"),
          ),
          FilledButton(
            onPressed: () {
              ActionUtil.dealAction(action: () async {
                await Future.delayed(const Duration(seconds: 3));
                throw CoreError.netCancel;
              });
            },
            child: const Text("ActionUtil.dealAction throw CoreError.netCancel"),
          ),
          FilledButton(
            onPressed: () {
              ActionUtil.dealAction(action: () async {
                await Future.delayed(const Duration(seconds: 3));
                throw "其他异常";
              });
            },
            child: const Text("ActionUtil.dealAction throw 其他异常"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_loading_util_page_logic.dart';
import 'test_loading_util_page_state.dart';

class TestLoadingUtilPage extends BasePageStatefulWidget {
  const TestLoadingUtilPage({
    super.key,
    super.getTag,
  });

  factory TestLoadingUtilPage.fromRouteParas(Map<String, dynamic> json) => TestLoadingUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_loading_util";

  @override
  State<TestLoadingUtilPage> createState() => _TestLoadingUtilPageState();
}

class _TestLoadingUtilPageState extends BasePageState<TestLoadingUtilPageLogic, TestLoadingUtilPageState, TestLoadingUtilPage> {
  @override
  TestLoadingUtilPageLogic initGetxController() => TestLoadingUtilPageLogic();

  bool isDark = false;

  @override
  Widget buildScaffold(BuildContext context, TestLoadingUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              setState(() {
                isDark = false;
              });
              LoadingUtil.showDialog(context);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog(context);
              });
            },
            child: const Text("Toast，自动判断暗黑模式"),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                isDark = true;
              });
              LoadingUtil.showDialog(context, isDark: true);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog(context);
              });
            },
            child: const Text("Toast，强制成暗黑模式"),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                isDark = false;
              });
              LoadingUtil.showDialog(context, isDark: false);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog(context);
              });
            },
            child: const Text("Toast，强制成白色模式"),
          ),
        ],
      ),
    );
  }
}

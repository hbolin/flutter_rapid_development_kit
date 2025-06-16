import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_base_page_logic.dart';
import 'test_base_page_state.dart';

class TestBasePage extends BasePageStatefulWidget {
  const TestBasePage({
    super.key,
    super.getTag,
  });

  factory TestBasePage.fromRouteParas(Map<String, dynamic> json) => TestBasePage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_base";

  @override
  State<TestBasePage> createState() => _TestBasePageState();
}

class _TestBasePageState extends BasePageState<TestBasePageLogic, TestBasePageState, TestBasePage> {
  @override
  TestBasePageLogic initGetxController() => TestBasePageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestBasePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: buildAppBackButton(context),
      ),
      body: Placeholder(),
    );
  }

  // @override
  // Widget? buildCustomAppBackButton(BuildContext context) {
  //   return Text("返");
  // }

  @override
  Widget? buildCustomLoadingWidget(BuildContext context, bool isPage, Widget appBackButton) {
    return BasePageDefaultLoadingWidget(
      isPage: isPage,
      appBackButton: appBackButton,
      defaultLoadingWidget: Center(child: Text("加载中!!!!")),
    );
  }

  @override
  Widget? buildCustomErrorWidget(BuildContext context, bool isPage, Widget appBackButton, CachedLoadingBodyController controller, error) {
    return BasePageDefaultErrorWidget(
      isPage: isPage,
      appBackButton: appBackButton,
      controller: controller,
      error: error,
      defaultErrorWidget: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.reloadData();
        },
        child: Center(
          child: Text(
            "加载错误!!!:$error", // 这里会涉及到多语言，所以不写死错误信息，直接由error显示出来
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}

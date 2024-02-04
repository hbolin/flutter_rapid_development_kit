import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_toast_util2_page_logic.dart';
import 'test_toast_util2_page_state.dart';

class TestToastUtil2Page extends BasePageStatefulWidget {
  const TestToastUtil2Page({
    super.key,
    super.getTag,
  });

  factory TestToastUtil2Page.fromRouteParas(Map<String, dynamic> json) => TestToastUtil2Page(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_toast_util2";

  @override
  State<TestToastUtil2Page> createState() => _TestToastUtil2PageState();
}

class _TestToastUtil2PageState extends BasePageState<TestToastUtil2PageLogic, TestToastUtil2PageState, TestToastUtil2Page> {
  @override
  TestToastUtil2PageLogic initGetxController() => TestToastUtil2PageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestToastUtil2PageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("显示Toast"),
      ),
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              ToastUtil.show("显示Toast");
            },
            child: const Text("Toast，自动判断暗黑模式"),
          ),
          FilledButton(
            onPressed: () {
              ToastUtil.show("显示Toast --  isDark: true", isDark: true);
            },
            child: const Text("Toast，强制成暗黑模式"),
          ),
          FilledButton(
            onPressed: () {
              ToastUtil.customShow("显示Toast --  customShow");
            },
            child: const Text("Toast，自定义显示"),
          ),
          FilledButton(
            onPressed: () {
              Get.toNamed(TestToastUtil2Page(getTag: "get_tag_${Random.secure().nextInt(100000)}").getRoute());
            },
            child: const Text("Toast，自定义显示"),
          ),
          Text("显示getTag:${widget.getTag}"),
          FilledButton(
            onPressed: () {
              logic.reloadData();
            },
            child: const Text("重新加载数据"),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildDefaultLoadingWidget(BuildContext context) {
    return const Text("加载中..");
  }

  @override
  Widget buildDefaultErrorWidget(BuildContext context, CachedLoadingBodyController controller, error) {
    return Text("加载失败,:$error");
  }
}

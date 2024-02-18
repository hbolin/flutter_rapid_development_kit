import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_loading_body_page_logic.dart';
import 'test_loading_body_page_state.dart';

class TestLoadingBodyPage extends BasePageStatefulWidget {
  const TestLoadingBodyPage({
    super.key,
    super.getTag,
  });

  factory TestLoadingBodyPage.fromRouteParas(Map<String, dynamic> json) => TestLoadingBodyPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_loading_body";

  @override
  State<TestLoadingBodyPage> createState() => _TestLoadingBodyPageState();
}

class _TestLoadingBodyPageState extends BasePageState<TestLoadingBodyPageLogic, TestLoadingBodyPageState, TestLoadingBodyPage> {
  @override
  TestLoadingBodyPageLogic initGetxController() => TestLoadingBodyPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestLoadingBodyPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          LoadingBody(
            dataLoader: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
            bodyBuilder: (BuildContext context) {
              return const Text("加载成功");
            },
          ),
          LoadingBody(
            dataLoader: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
            loadingWidgetBuilder: (BuildContext context) {
              return const Text("加载中....");
            },
            loadFailedWidgetBuilder: (BuildContext context, LoadingBodyController controller, dynamic error) {
              return const Text("加载中....");
            },
            bodyBuilder: (BuildContext context) {
              return const Text("加载成功");
            },
          ),
          LoadingBody(
            dataLoader: () async {
              // await Future.delayed(const Duration(seconds: 3));
              // throw "load failed";
            },
            loadFailedWidgetBuilder: (BuildContext context, LoadingBodyController controller, dynamic error) {
              return Text("加载失败！error:$error");
            },
            bodyBuilder: (BuildContext context) {
              return const Text("加载成功");
            },
          ),
          LoadingBody(
            onLoadingBodyCreated: (controller) {
              state.loadingBodyController = controller;
            },
            dataLoader: () async {
              // await Future.delayed(const Duration(seconds: 3));
              throw "load failed";
            },
            loadFailedWidgetBuilder: (BuildContext context, LoadingBodyController controller, dynamic error) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  state.loadingBodyController!.reloadData();
                },
                child: Text("加载失败！error:$error"),
              );
            },
            bodyBuilder: (BuildContext context) {
              return const Text("加载成功");
            },
            dataLoadingListener: () {
              LogUtil.debug("加载中...");
            },
            dataLoadedSuccessListener: () {
              LogUtil.debug("加载成功");
            },
            dataLoadedFailedListener: (dynamic error) {
              LogUtil.debug("加载失败:$error");
            },
            dataReloadListener: () {
              LogUtil.debug("重新加载");
            },
            initialAnimated: true,
            initialDelayedDisplay: true,
          ),
        ],
      ),
    );
  }
}

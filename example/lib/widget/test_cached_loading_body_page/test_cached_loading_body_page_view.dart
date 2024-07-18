import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_cached_loading_body_page_logic.dart';
import 'test_cached_loading_body_page_state.dart';

class TestCachedLoadingBodyPage extends BasePageStatefulWidget {
  const TestCachedLoadingBodyPage({
    super.key,
    super.getTag,
  });

  factory TestCachedLoadingBodyPage.fromRouteParas(Map<String, dynamic> json) => TestCachedLoadingBodyPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_cached_loading_body";

  @override
  State<TestCachedLoadingBodyPage> createState() => _TestCachedLoadingBodyPageState();
}

class _TestCachedLoadingBodyPageState extends BasePageState<TestCachedLoadingBodyPageLogic, TestCachedLoadingBodyPageState, TestCachedLoadingBodyPage> {
  @override
  TestCachedLoadingBodyPageLogic initGetxController() => TestCachedLoadingBodyPageLogic();

  CachedLoadingBodyController? _cachedLoadingBodyController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestCachedLoadingBodyPageLogic>(
      tag: widget.getTag,
      builder: (logic) {
        return buildScaffold(context, logic, false);
      },
    );
  }

  @override
  Widget buildScaffold(BuildContext context, TestCachedLoadingBodyPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: CachedLoadingBody(
        cachedDataLoader: () async {
          LogUtil.debug("加载缓存数据 -- cachedDataLoader");
          await Future.delayed(const Duration(seconds: 1));
          throw "模拟加载缓存数据失败";
        },
        dataLoader: () async {
          await Future.delayed(const Duration(seconds: 1));
          throw "模拟加载正常数据失败";
        },
        loadingWidgetBuilder: (BuildContext context) {
          return const Text("加载数据中...");
        },
        bodyBuilder: (BuildContext context, bool isCachedData) {
          LogUtil.debug("bodyBuilder -- 当前是否是缓存:$isCachedData");
          return Column(
            children: [
              TextButton(
                child: Text("当前是否是缓存:$isCachedData，点击重新加载"),
                onPressed: () {
                  _cachedLoadingBodyController!.reloadData();
                },
              ),
            ],
          );
        },
        loadFailedWidgetBuilder: (BuildContext context, CachedLoadingBodyController controller, dynamic error) {
          return GestureDetector(
            onTap: () {
              LogUtil.debug("点击重新加载");
              LogUtil.debug("====================================================================================================");
              controller.reloadData();
            },
            child: Text("自定loadFailedWidgetBuilder：\n $error"),
          );
        },
        cachedDataLoadingListener: () {
          LogUtil.debug("加载缓存数据 -- cachedDataLoadingListener 加载中...");
        },
        cachedDataLoadedSuccessListener: () {
          LogUtil.debug("加载缓存数据 -- cachedDataLoadedSuccessListener 加载成功!");
        },
        cachedDataLoadedFailedListener: (e) {
          LogUtil.debug("加载缓存数据 -- cachedDataLoadedFailedListener 加载失败，$e");
        },
        dataLoadingListener: () {
          LogUtil.debug("加载正常数据 -- dataLoadingListener 加载中...");
        },
        dataLoadedSuccessListener: () {
          LogUtil.debug("加载正常数据 -- dataLoadedSuccessListener 加载成功!");
        },
        dataLoadedFailedListener: (bool isCachedDataLoadedSuccess, e) {
          LogUtil.debug("加载正常数据 -- dataLoadedFailedListener 加载失败，加载缓存数据是否成功:$isCachedDataLoadedSuccess，error:$e");
          defaultDataLoadedFailedListener(isCachedDataLoadedSuccess, e);
        },
        dataReloadListener: () {
          LogUtil.debug("重新加载数据 -- dataReloadListener");
        },
        onCachedLoadingBodyCreated: (CachedLoadingBodyController controller) {
          _cachedLoadingBodyController = controller;
        },
      ),
    );
  }
}

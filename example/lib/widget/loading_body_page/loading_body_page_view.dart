import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'loading_body_page_logic.dart';
import 'loading_body_page_state.dart';

class LoadingBodyPage extends BasePageStatefulWidget {
  const LoadingBodyPage({
    super.key,
    super.getTag,
  });

  factory LoadingBodyPage.fromRouteParas(Map<String, dynamic> json) => LoadingBodyPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/loading_body";

  @override
  State<LoadingBodyPage> createState() => _LoadingBodyPageState();
}

class _LoadingBodyPageState extends BasePageState<LoadingBodyPageLogic, LoadingBodyPageState, LoadingBodyPage> {
  @override
  LoadingBodyPageLogic initGetxController() => LoadingBodyPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return Text("Loading");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, LoadingBodyPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text("记载完成"),
      ),
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

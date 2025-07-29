import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'loading_util_page_logic.dart';
import 'loading_util_page_state.dart';

class LoadingUtilPage extends BasePageStatefulWidget {
  const LoadingUtilPage({
    super.key,
    super.getTag,
  });

  factory LoadingUtilPage.fromRouteParas(Map<String, dynamic> json) => LoadingUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/loading_util";

  @override
  State<LoadingUtilPage> createState() => _LoadingUtilPageState();
}

class _LoadingUtilPageState extends BasePageState<LoadingUtilPageLogic, LoadingUtilPageState, LoadingUtilPage> {
  @override
  LoadingUtilPageLogic initGetxController() => LoadingUtilPageLogic();

  @override
  Widget buildScaffold(BuildContext context, LoadingUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              LoadingUtil.showDialog();
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog();
              });
            },
            child: const Text("LoadingUtil.showDialog"),
          ),
          ElevatedButton(
            onPressed: () {
              LoadingUtil.showDialog(isDark: true);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog();
              });
            },
            child: const Text("LoadingUtil.showDialog"),
          ),
          ElevatedButton(
            onPressed: () {
              LoadingUtil.showDialog(isDark: false);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog();
              });
            },
            child: const Text("LoadingUtil.showDialog"),
          ),
        ],
      ),
    );
  }
}

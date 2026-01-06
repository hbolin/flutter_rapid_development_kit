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
  Widget? buildAppBarTitle(BuildContext context) {
    return Text("LoadingUtil");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, LoadingUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16, width: double.infinity),
          Switch(
            value: state.isDark,
            onChanged: (value) {
              setState(() {
                state.isDark = value;
              });
              if (state.isDark) {
                Get.changeTheme(ThemeData.dark());
              } else {
                Get.changeTheme(ThemeData.light());
              }
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              LoadingUtil.showDialog();
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog();
              });
            },
            child: const Text("LoadingUtil.showDialog auto"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              LoadingUtil.showDialog(isDark: true);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog();
              });
            },
            child: const Text("LoadingUtil.showDialog isDark: true"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              LoadingUtil.showDialog(isDark: false);
              Future.delayed(const Duration(seconds: 3)).then((value) {
                LoadingUtil.dismissDialog();
              });
            },
            child: const Text("LoadingUtil.showDialog isDark: false"),
          ),
        ],
      ),
    );
  }
}

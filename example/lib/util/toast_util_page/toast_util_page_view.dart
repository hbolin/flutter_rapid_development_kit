import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'toast_util_page_logic.dart';
import 'toast_util_page_state.dart';

class ToastUtilPage extends BasePageStatefulWidget {
  const ToastUtilPage({
    super.key,
    super.getTag,
  });

  factory ToastUtilPage.fromRouteParas(Map<String, dynamic> json) => ToastUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/toast_util";

  @override
  State<ToastUtilPage> createState() => _ToastUtilPageState();
}

class _ToastUtilPageState extends BasePageState<ToastUtilPageLogic, ToastUtilPageState, ToastUtilPage> {
  @override
  ToastUtilPageLogic initGetxController() => ToastUtilPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ToastUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
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
              }),
          ElevatedButton(
            onPressed: () {
              ToastUtil.show("ToastUtil.show");
            },
            child: const Text("ToastUtil.show"),
          ),
          ElevatedButton(
            onPressed: () {
              ToastUtil.show("ToastUtil.show", isDark: false);
            },
            child: const Text("ToastUtil.show"),
          ),
          ElevatedButton(
            onPressed: () {
              ToastUtil.show("ToastUtil.show", isDark: true);
            },
            child: const Text("ToastUtil.show"),
          ),
          ElevatedButton(
            onPressed: () {
              ToastUtil.customShow(
                "ToastUtil.customShow",
                backgroundColor: Colors.red,
                textColor: Colors.green,
              );
            },
            child: const Text("ToastUtil.customShow"),
          ),
        ],
      ),
    );
  }
}

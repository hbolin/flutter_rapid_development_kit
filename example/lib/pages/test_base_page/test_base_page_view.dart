import 'package:example/pages/tab2_page/tab2_page_view.dart';
import 'package:example/pages/tab_page/tab_page_view.dart';
import 'package:example/widget/loading_body_page/loading_body_page_view.dart';
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
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("TextBasePage");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, TestBasePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              // Get.toNamed(LoadingBodyPage().getRoute());
              // Get.toNamed(TabPage().getRoute());
              Get.toNamed(Tab2Page().getRoute());
            },
            child: Text("查看跳转到下一个页面，标题是否会被替换"),
          ),
        ],
      ),
    );
  }

  @override
  Widget? buildCustomLoadingWidget(BuildContext context, bool isPage, Widget appBackButton, Widget? appBarTitle) {
    // return Container(
    //   color: Colors.green,
    //   child: const DefaultLoadingWidget(),
    // );
    // return BasePageDefaultLoadingWidget(
    //   isPage: isPage,
    //   appBarBackButton: appBackButton,
    //   appBarTitle: appBarTitle,
    //   // defaultLoadingWidget: Center(child: Text("加载中!!!!")),
    // );
  }

  // @override
  // Widget? buildCustomErrorWidget(BuildContext context, bool isPage, Widget appBackButton, Widget? appBarTitle, CachedLoadingBodyController controller, error) {
  //   return Container(
  //     color: Colors.amber,
  //     child: DefaultErrorWidget(
  //       error: "$error",
  //       onTap: () {
  //         controller.reloadData();
  //       },
  //     ),
  //   );
  //   return BasePageDefaultErrorWidget(
  //     isPage: isPage,
  //     appBarBackButton: appBackButton,
  //     appBarTitle: appBarTitle,
  //     controller: controller,
  //     error: error,
  //     defaultErrorWidget: GestureDetector(
  //       behavior: HitTestBehavior.opaque,
  //       onTap: () {
  //         controller.reloadData();
  //       },
  //       child: Center(
  //         child: Text(
  //           "加载错误!!!:$error", // 这里会涉及到多语言，所以不写死错误信息，直接由error显示出来
  //           style: Theme.of(context).textTheme.bodySmall,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

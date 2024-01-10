import 'package:example/pages/happy_pay_page/happy_pay_page_view.dart';
import 'package:example/pages/hello_page/hello_page_view.dart';
import 'package:example/pages/test_app_base4_page/test_app_base4_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_app_base3_page_logic.dart';
import 'test_app_base3_page_state.dart';

class TestAppBase3Page extends AppBasePageStatefulWidget {
  const TestAppBase3Page({
    super.key,
    super.initialGetTag = "singleton",
  });

  @override
  String getRouteName() => "/TestAppBase3Page";

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  State<TestAppBase3Page> createState() => _TestAppBase3PageState();
}

class _TestAppBase3PageState extends AppBasePageState<TestAppBase3Page> {
  late final TestAppBase3PageLogic logic;
  late final TestAppBase3PageState state;
  late final String getTag;

  @override
  void initState() {
    getTag = widget.initialGetTag ?? "${runtimeType}_$hashCode";
    logic = Get.put(TestAppBase3PageLogic(), tag: getTag);
    state = Get.find<TestAppBase3PageLogic>(tag: getTag).state;
    state.page = widget;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TestAppBase3Page oldWidget) {
    state.page = widget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestAppBase3PageLogic>(
      tag: getTag,
      builder: (logic) {
        return buildCachedLoadingBody(context, logic, (context, isCachedData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // var pageView4 = const HappyPayPage(pageId: 666);
                  // print("点击跳转页面：${pageView4.runtimeType} hashCode：${pageView4.hashCode} 参数:${pageView4.getRouteParas()}");
                  // Get.toNamed(pageView4.getRoute());
                  Get.toNamed(HelloPage().getRoute());
                },
                child: const Text("跳转至PageView4"),
              ),
            ],
          );
        });
      },
    );
  }
}

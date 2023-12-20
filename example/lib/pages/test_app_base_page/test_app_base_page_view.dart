import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_app_base_page_logic.dart';
import 'test_app_base_page_state.dart';

class TestAppBasePage extends AppBasePageStatefulWidget {
  const TestAppBasePage({
    super.key,
    super.initialGetTag,
  });

  @override
  String getRouteName() => "/TestAppBasePage";

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  State<TestAppBasePage> createState() => _TestAppBasePageState();
}

class _TestAppBasePageState extends AppBasePageState<TestAppBasePage> {
  late final TestAppBasePageLogic logic;
  late final TestAppBasePageState state;
  late final String getTag;

  @override
  void initState() {
    getTag = widget.initialGetTag ?? "${runtimeType}_$hashCode";
    logic = Get.put(TestAppBasePageLogic(), tag: getTag);
    state = Get.find<TestAppBasePageLogic>(tag: getTag).state;
    state.page = widget;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TestAppBasePage oldWidget) {
    state.page = widget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestAppBasePageLogic>(
      tag: getTag,
      builder: (logic) {
        return buildCachedLoadingBody(context, logic, (context, isCachedData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("标题"),
            ),
            body: Center(
              child: GestureDetector(
                onTap: () {
                  logic.reloadData();
                },
                child: Text("加载数据成功，是否是缓存数据：$isCachedData"),
              ),
            ),
          );
        });
      },
    );
  }
}

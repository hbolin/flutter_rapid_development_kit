import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_root_page_logic.dart';
import 'test_root_page_state.dart';

class TestRootPage extends AppBasePageStatefulWidget {
  const TestRootPage({
    super.key,
    super.initialGetTag,
  });

  factory TestRootPage.fromRouteParas(Map<String, dynamic> json) => TestRootPage(
        initialGetTag: convertT<String?>(json['initialGetTag']),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/TestRootPage";

  @override
  State<TestRootPage> createState() => _TestRootPageState();
}

class _TestRootPageState extends AppBasePageState<TestRootPage> {
  static const getxSingletonTag = "singleton";

  late final TestRootPageLogic logic;
  late final TestRootPageState state;
  late final String getTag;

  @override
  void initState() {
    getTag = widget.initialGetTag ?? getxSingletonTag;
    logic = Get.put(TestRootPageLogic(), tag: getTag);
    state = Get.find<TestRootPageLogic>(tag: getTag).state;
    state.page = widget;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TestRootPage oldWidget) {
    state.page = widget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestRootPageLogic>(
      tag: getTag,
      builder: (logic) {
        return buildCachedLoadingBody(context, logic, (context, isCachedData) {
          return Container();
        });
      },
    );
  }
}

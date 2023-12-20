import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_app_base4_page_logic.dart';
import 'test_app_base4_page_state.dart';

class TestAppBase4Page extends AppBasePageStatefulWidget {
  final int? pageId;

  const TestAppBase4Page({
    super.key,
    super.initialGetTag,
    this.pageId,
  });

  factory TestAppBase4Page.fromRouteParas(Map<String, dynamic> json) => TestAppBase4Page(
        initialGetTag: convertT<String?>(json['initialGetTag']),
        // TODO:配置路由参数
        pageId: convertT<int?>(json['pageId']),
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
        "pageId": pageId,
      };

  @override
  String getRouteName() => "/TestAppBase4Page";

  @override
  State<TestAppBase4Page> createState() => _TestAppBase4PageState();
}

class _TestAppBase4PageState extends AppBasePageState<TestAppBase4Page> {
  static const getxSingletonTag = "singleton";

  late final TestAppBase4PageLogic logic;
  late final TestAppBase4PageState state;
  late final String getTag;

  @override
  void initState() {
    getTag = widget.initialGetTag ?? getxSingletonTag;
    logic = Get.put(TestAppBase4PageLogic(), tag: getTag);
    state = Get.find<TestAppBase4PageLogic>(tag: getTag).state;
    state.page = widget;
    super.initState();
    print(
        "页面：${widget.runtimeType} hashCode:${widget.hashCode} initState widget.initialGetTag:${widget.initialGetTag} getTag:$getTag  getxSingletonTag:$getxSingletonTag");
  }

  @override
  void didUpdateWidget(covariant TestAppBase4Page oldWidget) {
    print(
        "页面：${widget.runtimeType} hashCode:${widget.hashCode} didUpdateWidget widget.initialGetTag:${widget.initialGetTag} getTag:$getTag  getxSingletonTag:$getxSingletonTag");
    state.page = widget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestAppBase4PageLogic>(
      tag: getTag,
      builder: (logic) {
        return buildCachedLoadingBody(context, logic, (context, isCachedData) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("当前获取到的PageId：${widget.pageId}"),
                Text("当前获取到的PageId：${state.page.pageId}"),
              ],
            ),
          );
        });
      },
    );
  }
}

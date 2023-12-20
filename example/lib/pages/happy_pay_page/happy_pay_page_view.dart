import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'happy_pay_page_logic.dart';
import 'happy_pay_page_state.dart';

class HappyPayPage extends AppBasePageStatefulWidget {
  final int? pageId;

  const HappyPayPage({
    super.key,
    super.initialGetTag,
    this.pageId,
  });

  factory HappyPayPage.fromRouteParas(Map<String, dynamic> json) => HappyPayPage(
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
  String getRouteName() => "/HappyPayPage";

  @override
  State<HappyPayPage> createState() => _HappyPayPageState();
}

class _HappyPayPageState extends AppBasePageState<HappyPayPage> {
  static const getxSingletonTag = "singleton";

  late final HappyPayPageLogic logic;
  late final HappyPayPageState state;
  late final String getTag;

  @override
  void initState() {
    getTag = widget.initialGetTag ?? getxSingletonTag;
    logic = Get.put(HappyPayPageLogic(), tag: getTag);
    state = Get.find<HappyPayPageLogic>(tag: getTag).state;
    state.page = widget;
    super.initState();
    print(
        "页面：${widget.runtimeType} hashCode:${widget.hashCode} initState widget.initialGetTag:${widget.initialGetTag} getTag:$getTag  getxSingletonTag:$getxSingletonTag state.page.pageId:${state.page.pageId}");
  }

  @override
  void didUpdateWidget(covariant HappyPayPage oldWidget) {
    state.page = widget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HappyPayPageLogic>(
      tag: getTag,
      builder: (logic) {
        return buildCachedLoadingBody(context, logic, (context, isCachedData) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("当前获取到的PageId widget.pageId：${widget.pageId}"),
                Text("当前获取到的PageId state.page.pageId：${state.page.pageId}"),
              ],
            ),
          );
        });
      },
    );
  }
}

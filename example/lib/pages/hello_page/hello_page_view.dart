import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'hello_page_logic.dart';
import 'hello_page_state.dart';

class HelloPage extends AppBasePageStatefulWidget {
  const HelloPage({
    super.key,
    super.initialGetTag,
  });

  factory HelloPage.fromRouteParas(Map<String, dynamic> json) => HelloPage(
        initialGetTag: convertT<String?>(json['initialGetTag']),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/HelloPage";

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends _HelloPageBaseState<HelloPage> {
  @override
  Widget buildScaffold(BuildContext context, HelloPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // TODO：
        ],
      ),
    );
  }
}

// ------------------------------------------------------ 基于Getx基础页面框架 ------------------------------------------------------

abstract class _HelloPageBaseState<T extends HelloPage> extends AppBasePageState<HelloPage> {
  late final HelloPageLogic logic;
  late final HelloPageState state;
  late final String? getTag;

  @override
  @mustCallSuper
  void initState() {
    getTag = widget.initialGetTag;
    logic = Get.put(HelloPageLogic(), tag: getTag);
    state = Get.find<HelloPageLogic>(tag: getTag).state;
    state.page = widget;
    super.initState();
  }

  @override
  @mustCallSuper
  void didUpdateWidget(covariant HelloPage oldWidget) {
    state.page = widget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelloPageLogic>(
      tag: getTag,
      builder: (logic) {
        return buildCachedLoadingBody(context, logic, (context, isCachedData) {
          return buildScaffold(context, logic, isCachedData);
        });
      },
    );
  }

  Widget buildScaffold(BuildContext context, HelloPageLogic logic, bool isCachedData);
}

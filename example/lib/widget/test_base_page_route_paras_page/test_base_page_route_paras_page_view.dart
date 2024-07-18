import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_base_page_route_paras_page_logic.dart';
import 'test_base_page_route_paras_page_state.dart';

class TestBasePageRouteParasPage extends BasePageStatefulWidget {
  final String? bookId;

  const TestBasePageRouteParasPage({
    super.key,
    super.getTag,
    this.bookId,
  });

  factory TestBasePageRouteParasPage.fromRouteParas(Map<String, dynamic> json) => TestBasePageRouteParasPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
        bookId: convertT<String?>(json["bookId"]),
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
        "bookId": bookId,
      };

  @override
  String getRouteName() => "/test_base_page_route_paras";

  @override
  State<TestBasePageRouteParasPage> createState() => _TestBasePageRouteParasPageState();
}

class _TestBasePageRouteParasPageState extends BasePageState<TestBasePageRouteParasPageLogic, TestBasePageRouteParasPageState, TestBasePageRouteParasPage> {
  @override
  TestBasePageRouteParasPageLogic initGetxController() => TestBasePageRouteParasPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestBasePageRouteParasPageLogic logic, bool isCachedData) {
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

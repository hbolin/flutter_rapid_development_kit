import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_column_row_grid_view_page_logic.dart';
import 'test_column_row_grid_view_page_state.dart';

class TestColumnRowGridViewPage extends BasePageStatefulWidget {
  const TestColumnRowGridViewPage({
    super.key,
    super.getTag,
  });

  factory TestColumnRowGridViewPage.fromRouteParas(Map<String, dynamic> json) => TestColumnRowGridViewPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_column_row_grid_view";

  @override
  State<TestColumnRowGridViewPage> createState() => _TestColumnRowGridViewPageState();
}

class _TestColumnRowGridViewPageState extends BasePageState<TestColumnRowGridViewPageLogic, TestColumnRowGridViewPageState, TestColumnRowGridViewPage> {
  @override
  TestColumnRowGridViewPageLogic initGetxController() => TestColumnRowGridViewPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestColumnRowGridViewPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ColumnRowGridView(
          itemCount: 100,
          crossAxisCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Text("itemBuilder:$index");
          },
          horizontalSeparatorBuilder: (BuildContext context, int index) {
            return Text("horizontalSeparatorBuilder:$index");
          },
          verticalSeparatorBuilder: (BuildContext context, int index) {
            return Text("verticalSeparatorBuilder:$index");
          },
        ),
      ),
    );
  }
}

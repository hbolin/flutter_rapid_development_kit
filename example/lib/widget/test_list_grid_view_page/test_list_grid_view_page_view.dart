import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_list_grid_view_page_logic.dart';
import 'test_list_grid_view_page_state.dart';

class TestListGridViewPage extends BasePageStatefulWidget {
  const TestListGridViewPage({
    super.key,
    super.getTag,
  });

  factory TestListGridViewPage.fromRouteParas(Map<String, dynamic> json) => TestListGridViewPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_list_grid_view";

  @override
  State<TestListGridViewPage> createState() => _TestListGridViewPageState();
}

class _TestListGridViewPageState extends BasePageState<TestListGridViewPageLogic, TestListGridViewPageState, TestListGridViewPage> {
  @override
  TestListGridViewPageLogic initGetxController() => TestListGridViewPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestListGridViewPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return buildListGridView(
      context: context,
      itemCount: 101,
      crossAxisCount: 5,
      // scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 100,
          height: 200,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("$index"),
        );
      },
      horizontalSeparatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 20);
      },
      verticalSeparatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 50);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_separated_row_page_logic.dart';
import 'test_separated_row_page_state.dart';

class TestSeparatedRowPage extends BasePageStatefulWidget {
  const TestSeparatedRowPage({
    super.key,
    super.getTag,
  });

  factory TestSeparatedRowPage.fromRouteParas(Map<String, dynamic> json) => TestSeparatedRowPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_separated_row";

  @override
  State<TestSeparatedRowPage> createState() => _TestSeparatedRowPageState();
}

class _TestSeparatedRowPageState extends BasePageState<TestSeparatedRowPageLogic, TestSeparatedRowPageState, TestSeparatedRowPage> {
  @override
  TestSeparatedRowPageLogic initGetxController() => TestSeparatedRowPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestSeparatedRowPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SeparatedRow(
        itemCount: 3,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(height: 100, child: Text("itemBuilder:$index"));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Text("separatorBuilder:$index");
        },
      ),
    );
  }
}

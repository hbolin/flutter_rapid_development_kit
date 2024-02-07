import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_separated_column_page_logic.dart';
import 'test_separated_column_page_state.dart';

class TestSeparatedColumnPage extends BasePageStatefulWidget {
  const TestSeparatedColumnPage({
    super.key,
    super.getTag,
  });

  factory TestSeparatedColumnPage.fromRouteParas(Map<String, dynamic> json) => TestSeparatedColumnPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_separated_column";

  @override
  State<TestSeparatedColumnPage> createState() => _TestSeparatedColumnPageState();
}

class _TestSeparatedColumnPageState extends BasePageState<TestSeparatedColumnPageLogic, TestSeparatedColumnPageState, TestSeparatedColumnPage> {
  @override
  TestSeparatedColumnPageLogic initGetxController() => TestSeparatedColumnPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestSeparatedColumnPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SeparatedColumn(
        itemCount: 3,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(width: double.infinity, child: Text("itemBuilder:$index"));
        },
        separatorBuilder: (BuildContext context, int index) {
          return Text("separatorBuilder:$index");
        },
      ),
    );
  }
}

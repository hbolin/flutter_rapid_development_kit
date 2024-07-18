import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_string_number_converter_page_logic.dart';
import 'test_string_number_converter_page_state.dart';

class TestStringNumberConverterPage extends BasePageStatefulWidget {
  const TestStringNumberConverterPage({
    super.key,
    super.getTag,
  });

  factory TestStringNumberConverterPage.fromRouteParas(Map<String, dynamic> json) => TestStringNumberConverterPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_string_number_converter";

  @override
  State<TestStringNumberConverterPage> createState() => _TestStringNumberConverterPageState();
}

class _TestStringNumberConverterPageState
    extends BasePageState<TestStringNumberConverterPageLogic, TestStringNumberConverterPageState, TestStringNumberConverterPage> {
  @override
  TestStringNumberConverterPageLogic initGetxController() => TestStringNumberConverterPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestStringNumberConverterPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${"rrr".toIntOrNull()}"),
          Text("${"1".toIntOrNull()}"),
          Text("${"1.01".toDoubleOrNull()}"),
          Text("${"true".toBoolOrNull()}"),
          Text("${"false".toBoolOrNull()}"),
          Text("${"1".toBoolOrNull()}"),
          Text("${"1".toBoolOrNull(extraCondition: "1")}"),
          Text("${"1.01".toBoolOrNull(extraCondition: "1")}"),
        ],
      ),
    );
  }
}

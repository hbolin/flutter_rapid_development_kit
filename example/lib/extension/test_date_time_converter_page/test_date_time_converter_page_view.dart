import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_date_time_converter_page_logic.dart';
import 'test_date_time_converter_page_state.dart';

class TestDateTimeConverterPage extends BasePageStatefulWidget {
  const TestDateTimeConverterPage({
    super.key,
    super.getTag,
  });

  factory TestDateTimeConverterPage.fromRouteParas(Map<String, dynamic> json) => TestDateTimeConverterPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_date_time_converter";

  @override
  State<TestDateTimeConverterPage> createState() => _TestDateTimeConverterPageState();
}

class _TestDateTimeConverterPageState extends BasePageState<TestDateTimeConverterPageLogic, TestDateTimeConverterPageState, TestDateTimeConverterPage> {
  @override
  TestDateTimeConverterPageLogic initGetxController() => TestDateTimeConverterPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestDateTimeConverterPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateTime.now().dateFormat()),
          Text(DateTime.now().dateFormat(format: "yyyy年MM月dd日 HH时mm分ss秒")),
          Text(DateTime.now().dateFormat(format: "yyyy年MM月dd日 HH时mm分ss秒SSS毫秒")),
          Text(DateTime.now().dateFormat(format: "yyyy年MM月dd日")),
          const Text("--------------------------------------------------------------------------------"),
          Text("${DateTime.now().dateFormat().toDateTime()}"),
          Text("${DateTime.now().dateFormat(format: "yyyy年MM月dd日 HH时mm分ss秒").toDateTime(format: "yyyy年MM月dd日 HH时mm分ss秒")}"),
          Text("${DateTime.now().dateFormat(format: "yyyy年MM月dd日 HH时mm分ss秒SSS毫秒").toDateTime(format: "yyyy年MM月dd日 HH时mm分ss秒SSS毫秒")}"),
          Text("${DateTime.now().dateFormat(format: "yyyy年MM月dd日").toDateTime(format: "yyyy年MM月dd日")}"),
        ],
      ),
    );
  }
}

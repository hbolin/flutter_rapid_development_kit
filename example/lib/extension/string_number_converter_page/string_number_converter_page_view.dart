import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'string_number_converter_page_logic.dart';
import 'string_number_converter_page_state.dart';

class StringNumberConverterPage extends BasePageStatefulWidget {
  const StringNumberConverterPage({
    super.key,
    super.getTag,
  });

  factory StringNumberConverterPage.fromRouteParas(Map<String, dynamic> json) => StringNumberConverterPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/string_number_converter";

  @override
  State<StringNumberConverterPage> createState() => _StringNumberConverterPageState();
}

class _StringNumberConverterPageState extends BasePageState<StringNumberConverterPageLogic, StringNumberConverterPageState, StringNumberConverterPage> {
  @override
  StringNumberConverterPageLogic initGetxController() => StringNumberConverterPageLogic();

  @override
  Widget buildScaffold(BuildContext context, StringNumberConverterPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("${"rrr".toIntOrNull()}"),
          Text("${"1.01".toIntOrNull()}"),
          Text("${"1".toIntOrNull()}"),
          Text("${"1.01".toDoubleOrNull()}"),
          Text("${"true".toBoolOrNull()}"),
          Text("${"false".toBoolOrNull()}"),
          Text("${"1".toBoolOrNull()}"),
          Text("${"0".toBoolOrNull()}"),
          Text("${"1".toBoolOrNull(extraCondition: "1")}"),
          Text("${"1.01".toBoolOrNull(extraCondition: "1")}"),
          Text("${"1.01".toBoolOrNull(extraCondition: "1.01")}"),
        ],
      ),
    );
  }
}

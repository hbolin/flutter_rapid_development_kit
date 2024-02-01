import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_string_number_converter_page_logic.dart';

class TestStringNumberConverterPage extends StatelessWidget {
  TestStringNumberConverterPage({Key? key}) : super(key: key);

  final logic = Get.put(TestStringNumberConverterPageLogic());
  final state = Get.find<TestStringNumberConverterPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

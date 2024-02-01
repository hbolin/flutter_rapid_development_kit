import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_date_time_converter_page_logic.dart';

class TestDateTimeConverterPage extends StatelessWidget {
  TestDateTimeConverterPage({Key? key}) : super(key: key);

  final logic = Get.put(TestDateTimeConverterPageLogic());
  final state = Get.find<TestDateTimeConverterPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

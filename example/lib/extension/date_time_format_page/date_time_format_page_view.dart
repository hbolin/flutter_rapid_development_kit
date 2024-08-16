import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'date_time_format_page_logic.dart';
import 'date_time_format_page_state.dart';

class DateTimeFormatPage extends BasePageStatefulWidget {
  const DateTimeFormatPage({
    super.key,
    super.getTag,
  });

  factory DateTimeFormatPage.fromRouteParas(Map<String, dynamic> json) => DateTimeFormatPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/date_time_format";

  @override
  State<DateTimeFormatPage> createState() => _DateTimeFormatPageState();
}

class _DateTimeFormatPageState extends BasePageState<DateTimeFormatPageLogic, DateTimeFormatPageState, DateTimeFormatPage> {
  @override
  DateTimeFormatPageLogic initGetxController() => DateTimeFormatPageLogic();

  @override
  Widget buildScaffold(BuildContext context, DateTimeFormatPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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

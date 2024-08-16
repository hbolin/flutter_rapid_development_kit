import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'money_format_page_logic.dart';
import 'money_format_page_state.dart';

class MoneyFormatPage extends BasePageStatefulWidget {
  const MoneyFormatPage({
    super.key,
    super.getTag,
  });

  factory MoneyFormatPage.fromRouteParas(Map<String, dynamic> json) => MoneyFormatPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/money_format";

  @override
  State<MoneyFormatPage> createState() => _MoneyFormatPageState();
}

class _MoneyFormatPageState extends BasePageState<MoneyFormatPageLogic, MoneyFormatPageState, MoneyFormatPage> {
  @override
  MoneyFormatPageLogic initGetxController() => MoneyFormatPageLogic();

  @override
  Widget buildScaffold(BuildContext context, MoneyFormatPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(3.344.moneyFormat()),
          Text(3.345.moneyFormat()),
          Text(3.345.moneyFormat()),
          Text(3.34.moneyFormat()),
          Text(3.30.moneyFormat()),
          Text(.30.moneyFormat()),
          Text(3.00.moneyFormat()),
          Text(3.0.moneyFormat()),
          const Text("---------------------------------------"),
          Text("3.344".moneyFormat()),
          Text("3.345".moneyFormat()),
          Text("3.345".moneyFormat()),
          Text("3.34".moneyFormat()),
          Text("3.30".moneyFormat()),
          Text(".30".moneyFormat()),
          Text("3.00".moneyFormat()),
          Text("3.0".moneyFormat()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_money_format_page_logic.dart';
import 'test_money_format_page_state.dart';

class TestMoneyFormatPage extends BasePageStatefulWidget {
  const TestMoneyFormatPage({
    super.key,
    super.getTag,
  });

  factory TestMoneyFormatPage.fromRouteParas(Map<String, dynamic> json) => TestMoneyFormatPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_money_format";

  @override
  State<TestMoneyFormatPage> createState() => _TestMoneyFormatPageState();
}

class _TestMoneyFormatPageState extends BasePageState<TestMoneyFormatPageLogic, TestMoneyFormatPageState, TestMoneyFormatPage> {
  @override
  TestMoneyFormatPageLogic initGetxController() => TestMoneyFormatPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestMoneyFormatPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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

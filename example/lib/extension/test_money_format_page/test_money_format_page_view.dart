import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_money_format_page_logic.dart';

class TestMoneyFormatPage extends StatelessWidget {
  TestMoneyFormatPage({Key? key}) : super(key: key);

  final logic = Get.put(TestMoneyFormatPageLogic());
  final state = Get.find<TestMoneyFormatPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

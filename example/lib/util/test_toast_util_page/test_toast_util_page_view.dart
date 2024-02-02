import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_toast_util_page_logic.dart';

class TestToastUtilPage extends StatelessWidget {
  TestToastUtilPage({Key? key}) : super(key: key);

  final logic = Get.put(TestToastUtilPageLogic());
  final state = Get.find<TestToastUtilPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("显示Toast"),
      ),
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              ToastUtil.show("显示Toast");
            },
            child: const Text("Toast，自动判断暗黑模式"),
          ),
          FilledButton(
            onPressed: () {
              ToastUtil.show("显示Toast --  isDark: true", isDark: true);
            },
            child: const Text("Toast，强制成暗黑模式"),
          ),
          FilledButton(
            onPressed: () {
              ToastUtil.customShow("显示Toast --  customShow");
            },
            child: const Text("Toast，自定义显示"),
          ),
        ],
      ),
    );
  }
}

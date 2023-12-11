import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLogUtilPage extends StatefulWidget {
  const TestLogUtilPage({super.key});

  @override
  State<TestLogUtilPage> createState() => _TestLogUtilPageState();
}

class _TestLogUtilPageState extends State<TestLogUtilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              LogUtil.debug("输入出Debug日志");
            },
            child: const Text("打印Debug日志"),
          ),
          TextButton(
            onPressed: () {
              LogUtil.error("输入出Error日志");
            },
            child: const Text("打印Error日志"),
          )
        ],
      ),
    );
  }
}

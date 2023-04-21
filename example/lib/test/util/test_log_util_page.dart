import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestTestLogUtilPage extends StatefulWidget {
  const TestTestLogUtilPage({Key? key}) : super(key: key);

  @override
  State<TestTestLogUtilPage> createState() => _TestTestLogUtilPageState();
}

class _TestTestLogUtilPageState extends State<TestTestLogUtilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("日志打印 - 测试"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                LogUtil.d("HBL", "打印信息日志");
              },
              child: const Text("Log.d"),
            ),
            TextButton(
              onPressed: () {
                LogUtil.e("HBL", "打印错误日志");
              },
              child: const Text("Log.e"),
            ),
          ],
        ),
      ),
    );
  }
}

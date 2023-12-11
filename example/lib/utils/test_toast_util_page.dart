import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestToastUtilPage extends StatefulWidget {
  const TestToastUtilPage({super.key});

  @override
  State<TestToastUtilPage> createState() => _TestToastUtilPageState();
}

class _TestToastUtilPageState extends State<TestToastUtilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              ToastUtil.show("显示Toast");
            },
            child: const Text("显示Toast"),
          ),
        ],
      ),
    );
  }
}

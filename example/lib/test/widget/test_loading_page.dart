import 'package:example/test/test_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingPage extends StatefulWidget {
  const TestLoadingPage({super.key});

  @override
  State<TestLoadingPage> createState() => _TestLoadingPageState();
}

class _TestLoadingPageState extends State<TestLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoadingDialogUtil - 测试"),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TestTapItem(
            title: "loading...",
            onTap: () async {
              LoadingDialogUtil.show(context);
              await Future.delayed(const Duration(seconds: 3));
              LoadingDialogUtil.dismiss(context);
            },
          ),
        ],
      ),
    );
  }
}

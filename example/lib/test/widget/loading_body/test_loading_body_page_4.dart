import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_4 extends StatefulWidget {
  const TestLoadingBodyPage_4({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_4> createState() => _TestLoadingBodyPage_4State();
}

class _TestLoadingBodyPage_4State extends State<TestLoadingBodyPage_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 需要加载数据，需要延迟显示")),
      body: LoadingBody(
        loadData: () async {
          // await Future.delayed(const Duration(seconds: 1));
        },
        initialDelayedDisplay: true,
        buildBody: (BuildContext context) {
          return const Center(
            child: Text('加载数据成功'),
          );
        },
      ),
    );
  }
}

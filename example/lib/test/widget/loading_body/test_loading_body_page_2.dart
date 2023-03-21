import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_2 extends StatefulWidget {
  const TestLoadingBodyPage_2({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_2> createState() => _TestLoadingBodyPage_2State();
}

class _TestLoadingBodyPage_2State extends State<TestLoadingBodyPage_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 需要加载数据")),
      body: LoadingBody(
        loadData: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        buildBody: (BuildContext context) {
          return const Center(
            child: Text('加载数据成功'),
          );
        },
      ),
    );
  }
}

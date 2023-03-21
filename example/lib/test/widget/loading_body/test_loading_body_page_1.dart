import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_1 extends StatefulWidget {
  const TestLoadingBodyPage_1({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_1> createState() => _TestLoadingBodyPage_1State();
}

class _TestLoadingBodyPage_1State extends State<TestLoadingBodyPage_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 不需要加载数据")),
      body: LoadingBody(
        loadData: null,
        buildBody: (BuildContext context) {
          return const Center(
            child: Text('加载数据成功'),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_3 extends StatefulWidget {
  const TestLoadingBodyPage_3({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_3> createState() => _TestLoadingBodyPage_3State();
}

class _TestLoadingBodyPage_3State extends State<TestLoadingBodyPage_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 需要加载数据，需要显示渐变动画")),
      body: LoadingBody(
        loadData: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        isAnimated: true,
        buildBody: (BuildContext context) {
          return const Center(
            child: Text('加载数据成功'),
          );
        },
      ),
    );
  }
}

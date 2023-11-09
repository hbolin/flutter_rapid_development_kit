import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_6 extends StatefulWidget {
  const TestLoadingBodyPage_6({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_6> createState() => _TestLoadingBodyPage_6State();
}

class _TestLoadingBodyPage_6State extends State<TestLoadingBodyPage_6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 自定义加载中组件，并且加载失败")),
      body: LoadingBody(
        loadData: () async {
          await Future.delayed(const Duration(seconds: 1));
          throw "加载失败";
        },
        initialDelayedDisplay: false,
        buildBody: (BuildContext context) {
          return const Center(
            child: Text('加载数据成功'),
          );
        },
        loadingWidgetBuilder: (BuildContext context) {
          return const Center(
            child: Text('加载中...'),
          );
        },
      ),
    );
  }
}

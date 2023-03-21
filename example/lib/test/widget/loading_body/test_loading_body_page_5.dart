import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_5 extends StatefulWidget {
  const TestLoadingBodyPage_5({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_5> createState() => _TestLoadingBodyPage_5State();
}

class _TestLoadingBodyPage_5State extends State<TestLoadingBodyPage_5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 需要加载数据，不需要延迟显示")),
      body: LoadingBody(
        loadData: () async {
          // await Future.delayed(const Duration(seconds: 1));
        },
        isDelayedDisplay: false,
        buildBody: (BuildContext context) {
          return const Center(
            child: Text('加载数据成功'),
          );
        },
      ),
    );
  }
}

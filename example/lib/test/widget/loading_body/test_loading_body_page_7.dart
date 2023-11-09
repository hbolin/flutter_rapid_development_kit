import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_7 extends StatefulWidget {
  const TestLoadingBodyPage_7({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_7> createState() => _TestLoadingBodyPage_7State();
}

class _TestLoadingBodyPage_7State extends State<TestLoadingBodyPage_7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 自定义加载失败组件")),
      body: LoadingBody(
        loadData: () async {
          await Future.delayed(const Duration(seconds: 1));
          throw "没有网络连接，请检查网络连接";
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
        loadFailedWidgetBuilder: (BuildContext context, LoadingBodyController controller, dynamic error) {
          return GestureDetector(
            onTap: () {
              controller.reloadData();
            },
            child: Center(
              child: Text('加载失败，请点击重新加载。\n失败原因：$error'),
            ),
          );
        },
      ),
    );
  }
}

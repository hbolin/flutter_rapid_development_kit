import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestLoadingBodyPage_8 extends StatefulWidget {
  const TestLoadingBodyPage_8({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage_8> createState() => _TestLoadingBodyPage_8State();
}

class _TestLoadingBodyPage_8State extends State<TestLoadingBodyPage_8> {
  LoadingBodyController? _loadingBodyController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 监听")),
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
              _loadingBodyController?.reloadData();
            },
            child: Center(
              child: Text('加载失败，请点击重新加载。\n失败原因：$error'),
            ),
          );
        },
        dataLoadingListener: () {
          print('正在加载数据中...');
        },
        dataLoadedSuccessListener: () {
          print('数据加载成功！');
        },
        dataLoadedFailedListener: (error) {
          print('数据加载失败，原因：$error');
        },
        dataReloadListener: () {
          print('数据重新加载');
        },
        ondLoadingBodyCreated: (LoadingBodyController controller) {
          _loadingBodyController = controller;
        },
      ),
    );
  }
}

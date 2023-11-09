import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestCachedLoadingBodyPage extends StatefulWidget {
  const TestCachedLoadingBodyPage({Key? key}) : super(key: key);

  @override
  State<TestCachedLoadingBodyPage> createState() => _TestCachedLoadingBodyPageState();
}

class _TestCachedLoadingBodyPageState extends State<TestCachedLoadingBodyPage> {
  String? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CachedLoadingBody - 测试"),
      ),
      body: CachedLoadingBody(
        // initialDelayedDisplay: true,
        // initialAnimated: true,
        // loadData: null,
        loadData: () async {
          await Future.delayed(const Duration(seconds: 2));
          // throw "加载正常数据失败";
          data = "正常数据";
        },
        // loadCacheData: null,
        loadCacheData: () async {
          // throw "加载缓存数据失败";
          data = "缓存数据";
        },
        ondLoadingBodyCreated: (CachedLoadingBodyController controller) {
          LogUtil.d(LogUtil.tag, "ondLoadingBodyCreated...");
        },
        loadingWidgetBuilder: (BuildContext context) {
          return null;
          return const Center(child: Text('加载中'));
        },
        loadFailedWidgetBuilder: (BuildContext context, CachedLoadingBodyController controller, dynamic error) {
          return null;
          return GestureDetector(
            onTap: () {
              controller.reloadData();
            },
            child: const Center(child: Text('加载失败')),
          );
        },
        buildBody: (BuildContext context) {
          return Center(child: Text("$data"));
        },
        dataCacheLoadingListener: () {
          LogUtil.d(LogUtil.tag, "正在加载缓存数据中...");
        },
        dataCacheLoadedSuccessListener: () {
          LogUtil.d(LogUtil.tag, "加载缓存数据完成...");
        },
        dataLoadingListener: () {
          LogUtil.d(LogUtil.tag, "正在加载正常数据中...");
        },
        dataLoadedSuccessListener: () {
          LogUtil.d(LogUtil.tag, "加载正常数据完成...");
        },
        dataReloadListener: () {
          LogUtil.d(LogUtil.tag, "重新加载数据...");
        },
        dataLoadedFailedListener: (bool isCachedSuccess, dynamic error) {
          LogUtil.d(LogUtil.tag, "加载数据异常:$error...");
          if (isCachedSuccess) {
            // 如果缓存数据和正常数据都失败，则会去加载loadFailedWidgetBuilder()方法，不需要额外处理。
            // 如果缓存读取成功，但是正常数据加载失败，就toast提示下，而且最好是CachedLoadingBody用于页面级别，并且支持下拉刷新功能。
            // TODO：这里需要Toast提示下
            LogUtil.d(LogUtil.tag, "Toast错误:$error...");
          }
        },
      ),
    );
  }
}

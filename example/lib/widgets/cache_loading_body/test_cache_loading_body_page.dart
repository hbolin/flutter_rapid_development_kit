import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestCacheLoadingBodyPage extends StatefulWidget {
  const TestCacheLoadingBodyPage({super.key});

  @override
  State<TestCacheLoadingBodyPage> createState() => _TestCacheLoadingBodyPageState();
}

class _TestCacheLoadingBodyPageState extends State<TestCacheLoadingBodyPage> {
  CachedLoadingBodyController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CachedLoadingBody(
        onCachedLoadingBodyCreated: (controller) {
          this.controller = controller;
        },
        // dataLoader: null,
        // cachedDataLoader: null,
        cachedDataLoader: () async {
          await Future.delayed(const Duration(seconds: 1));
          // throw "模拟加载缓存数据失败的错误";
        },
        dataLoader: () async {
          await Future.delayed(const Duration(seconds: 1));
          // throw "模拟加载数据失败的错误";
        },
        loadingWidgetBuilder: (context) {
          return const Center(
            child: Text("自定义加载中..."),
          );
        },
        loadFailedWidgetBuilder: (BuildContext context, CachedLoadingBodyController controller, dynamic error) {
          return GestureDetector(
            onTap: () {
              controller.reloadData();
            },
            child: Center(
              child: Text("自定义加载失败:$error..."),
            ),
          );
        },
        bodyBuilder: (BuildContext context, bool isCacheData) {
          return Center(
            child: Column(
              children: [
                Text("加载数据成功,当前是否是缓存数据:$isCacheData"),
                TextButton(
                  onPressed: () {
                    controller!.reloadData();
                  },
                  child: const Text("重新加载数据"),
                ),
              ],
            ),
          );
        },
        cachedDataLoadingListener: () {
          LogUtil.debug("加载缓存数据中...");
        },
        cachedDataLoadedSuccessListener: () {
          LogUtil.debug("加载缓存数据成功！");
        },
        cachedDataLoadedFailedListener: (error) {
          LogUtil.debug("加载缓存数据失败！！！");
        },
        dataLoadingListener: () {
          LogUtil.debug("加载数据中...");
        },
        dataLoadedSuccessListener: () {
          LogUtil.debug("加载数据成功！");
        },
        dataLoadedFailedListener: (isCachedSuccess, error) {
          LogUtil.debug("加载数据失败！！！，加载缓存书是否成功:$isCachedSuccess");
        },
        dataReloadListener: () {
          LogUtil.debug("重新加载数据中...");
        },
      ),
    );
  }
}

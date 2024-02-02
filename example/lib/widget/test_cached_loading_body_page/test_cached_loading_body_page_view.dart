import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_cached_loading_body_page_logic.dart';

class TestCachedLoadingBodyPage extends StatelessWidget {
  TestCachedLoadingBodyPage({Key? key}) : super(key: key);

  final logic = Get.put(TestCachedLoadingBodyPageLogic());
  final state = Get.find<TestCachedLoadingBodyPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CachedLoadingBody(
        cachedDataLoader: () async {
          print("加载缓存数据 -- cachedDataLoader");
          await Future.delayed(const Duration(seconds: 1));
          throw "模拟加载缓存数据失败";
        },
        dataLoader: () async {
          await Future.delayed(const Duration(seconds: 1));
          throw "模拟加载正常数据失败";
        },
        loadingWidgetBuilder: (BuildContext context) {
          return const Text("加载数据中...");
        },
        bodyBuilder: (BuildContext context, bool isCachedData) {
          print("当前是否是缓存:$isCachedData");
          return Column(
            children: [Text("当前是否是缓存:$isCachedData")],
          );
        },
        // loadFailedWidgetBuilder: (BuildContext context, CachedLoadingBodyController controller, dynamic error) {
        //   return GestureDetector(
        //     onTap: () {
        //       print("点击重新加载");
        //       print("====================================================================================================");
        //       controller.reloadData();
        //     },
        //     child: Text("$error"),
        //   );
        // },
        cachedDataLoadingListener: () {
          print("加载缓存数据 -- 加载中...");
        },
        cachedDataLoadedSuccessListener: () {
          print("加载缓存数据 -- 加载成功!");
        },
        cachedDataLoadedFailedListener: (e) {
          print("加载缓存数据 -- 加载失败，$e");
        },
        dataLoadingListener: () {
          print("加载正常数据 -- 加载中...");
        },
        dataLoadedSuccessListener: () {
          print("加载正常数据 -- 加载成功!");
        },
        dataLoadedFailedListener: (bool isCachedDataLoadedSuccess, e) {
          print("加载正常数据 -- 加载失败，加载缓存数据是否成功:$isCachedDataLoadedSuccess，error:$e");
        },
        dataReloadListener: () {
          print("重新加载数据");
        },
      ),
    );
  }
}

import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_toast_util2_page_state.dart';

class TestToastUtil2PageLogic extends BasePageGetxController<TestToastUtil2PageState> {
  @override
  TestToastUtil2PageState initBasePageBaseState() => TestToastUtil2PageState();

  @override
  bool get needLoadCachedData => true;

  @override
  Future<void> loadData(bool isLoadCachedData) async {
    if (isLoadCachedData) {
      await Future.delayed(const Duration(seconds: 1));
      LogUtil.debug("开始加载缓存数据");
      throw "xxx";
    } else {
      LogUtil.debug("开始加载正常数据");
      // throw "xxx";
    }
    LogUtil.debug("当前的getTag:${state.page.getTag}");
  }

  @override
  void cachedDataLoadingListener() {
    LogUtil.debug("监听--缓存数据加载中...");
  }

  @override
  void cachedDataLoadedSuccessListener() {
    LogUtil.debug("监听--缓存数据，加载成功");
  }

  @override
  void cachedDataLoadedFailedListener(error) {
    LogUtil.debug("监听--缓存数据，加载失败");
  }

  @override
  void dataLoadingListener() {
    LogUtil.debug("监听--真实数据加载中...");
  }

  @override
  void dataLoadedSuccessListener() {
    LogUtil.debug("监听--真实数据，加载成功");
  }

  @override
  void dataLoadedFailedListener(bool isCachedDataLoadedSuccess, error) {
    LogUtil.debug("监听--真实数据，加载失败，是否加载缓存数据成功:$isCachedDataLoadedSuccess");
  }

  @override
  void dataReloadListener() {
    LogUtil.debug("监听--重新加载数据");
  }
}

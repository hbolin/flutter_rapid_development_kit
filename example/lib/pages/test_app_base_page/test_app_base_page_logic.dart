import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_app_base_page_state.dart';

class TestAppBasePageLogic extends AppBasePageGetxController {
  final TestAppBasePageState state = TestAppBasePageState();

  @override
  bool get needLoadCachedData => true;

  // @override
  // bool get needLoadData => false;

  @override
  Future<void> loadData(bool isLoadingCachedData) async {
    LogUtil.debug("是否是加载缓存数据:$isLoadingCachedData");
    await Future.delayed(const Duration(seconds: 1));
    // if (isLoadingCachedData == false) {
      throw "加载正常数据失败";
    // }
  }

  @override
  void cachedDataLoadingListener() {
    super.cachedDataLoadingListener();
    LogUtil.debug("监听缓存数据加载中...");
  }

  @override
  void cachedDataLoadedSuccessListener() {
    super.cachedDataLoadedSuccessListener();
    LogUtil.debug("监听缓存数据加载成功!");
  }

  @override
  void cachedDataLoadedFailedListener(error) {
    super.cachedDataLoadedFailedListener(error);
    LogUtil.debug("监听缓存数据加载失败！！！");
  }

  @override
  void dataLoadingListener() {
    super.dataLoadingListener();
    LogUtil.debug("监听正常数据加载中...");
  }

  @override
  void dataLoadedSuccessListener() {
    super.dataLoadedSuccessListener();
    LogUtil.debug("监听正常数据加载成功!");
  }

  @override
  void dataLoadedFailedListener(bool isCachedDataLoadedSuccess, error) {
    super.dataLoadedFailedListener(isCachedDataLoadedSuccess, error);
    LogUtil.debug("监听正常数据加载失败！！！加载缓存数据是否成功:$isCachedDataLoadedSuccess");
  }
}

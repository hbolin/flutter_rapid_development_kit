import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/util/log_util.dart';
import 'package:flutter_rapid_development_kit/src/util/toast_util.dart';
import 'package:flutter_rapid_development_kit/src/widget/cached_loading_body.dart';
import 'package:get/get.dart';

/// 监听页面跳转的回调，例如didPopNext；didPushNext；didPush；didPop等。
/// routeObserver需要配置到MaterialApp上，否则监听路由跳转的方法无法生效。
///
/// ```dart
///     MaterialApp(
///       navigatorObservers: <RouteObserver<ModalRoute<void>>>[
///         routeObserver,
///       ],
///     );
/// ```
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

/// 基于Getx的动态路由编写对应的基础页面。
abstract class BasePageStatefulWidget extends StatefulWidget {
  static const getTagKey = "g_tag";

  const BasePageStatefulWidget({
    super.key,
    required this.getTag,
  });

  final String? getTag;

  String getRoute() {
    var routeParasString = _getRouteParasString();
    return routeParasString?.isNotEmpty != true ? getRouteName() : "${getRouteName()}?$routeParasString";
  }

  String? _getRouteParasString() {
    var routeParas = _getRouteParas();
    routeParas?.removeWhere((key, value) => value == null);
    return routeParas?.entries.map((e) => "${e.key}=${e.value}").join("&");
  }

  Map<String, dynamic>? _getRouteParas() {
    var routeParas = getRouteParas();
    assert(routeParas?.keys.firstWhereOrNull((element) => element == getTagKey) == null, "路由参数key不能设置为$getTagKey，与get使用的tag冲突。");
    return {
      getTagKey: getTag,
      ...?getRouteParas(),
    };
  }

  String getRouteName();

  Map<String, dynamic>? getRouteParas();
}

abstract class BasePageState<K extends BasePageGetxController<S>, S extends BasePageBaseState<T>, T extends BasePageStatefulWidget> extends _BasePageState<T> {
  late final K logic;
  late final S state;
  late final String? _getTag;

  @override
  @mustCallSuper
  void initState() {
    _getTag = widget.getTag;
    logic = Get.put<K>(initGetxController(), tag: _getTag);
    state = Get.find<K>(tag: _getTag).state;
    state.page = widget;
    super.initState();
  }

  @override
  @mustCallSuper
  void didUpdateWidget(covariant T oldWidget) {
    state.page = widget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<K>(
      tag: _getTag,
      builder: (logic) {
        return _buildCachedLoadingBody(context, logic, (context, isCachedData) {
          return buildScaffold(context, logic, isCachedData);
        });
      },
    );
  }

  K initGetxController();

  Widget buildScaffold(BuildContext context, K logic, bool isCachedData);
}

abstract class _BasePageState<T extends StatefulWidget> extends State<T> with RouteAware {
  @override
  void initState() {
    super.initState();
    LogUtil.debug("【创建页面】:$runtimeType");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
    LogUtil.debug("【销毁页面】:$runtimeType");
  }

  /// Scaffold Body集成CachedLoadingBody用来管理页面加载状态的处理：加载中 -> 加载成功/加载失败
  Widget _buildCachedLoadingBody(
      BuildContext context, BasePageGetxController controller, Widget Function(BuildContext context, bool isCachedData) scaffoldBuilder) {
    return CachedLoadingBody(
      cachedDataLoader: controller.needLoadCachedData
          ? () async {
              return await controller._loadData(true);
            }
          : null,
      dataLoader: controller.needLoadData
          ? () async {
              return await controller._loadData(false);
            }
          : null,
      bodyBuilder: scaffoldBuilder,
      onCachedLoadingBodyCreated: (CachedLoadingBodyController cachedLoadingBodyController) {
        controller._cachedLoadingBodyController = cachedLoadingBodyController;
      },
      loadingWidgetBuilder: buildDefaultLoadingWidget,
      loadFailedWidgetBuilder: buildDefaultErrorWidget,
      cachedDataLoadingListener: controller.cachedDataLoadingListener,
      cachedDataLoadedSuccessListener: controller.cachedDataLoadedSuccessListener,
      cachedDataLoadedFailedListener: controller.cachedDataLoadedFailedListener,
      dataLoadingListener: controller.dataLoadingListener,
      dataLoadedSuccessListener: controller.dataLoadedSuccessListener,
      dataLoadedFailedListener: (bool isCachedDataLoadedSuccess, dynamic error) {
        if (isCachedDataLoadedSuccess) {
          // 如果加载缓存数据成功，但加载真实数据失败，需要使用toast提示
          ToastUtil.show(error.toString());
        }
        controller.dataLoadedFailedListener(isCachedDataLoadedSuccess, error);
      },
      dataReloadListener: controller.dataReloadListener,
    );
  }

  /// 默认"加载中"样式
  Widget buildDefaultLoadingWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CupertinoActivityIndicator(
          radius: 12,
        ),
      ),
    );
  }

  /// 加载"加载失败"样式
  Widget buildDefaultErrorWidget(BuildContext context, CachedLoadingBodyController controller, dynamic error) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.reloadData();
        },
        child: Center(
          child: Text(
            "$error", // 这里会涉及到多语言，所以不写死错误信息，直接由error显示出来
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }

  /// Called when the top route has been popped off, and the current route shows up.
  @override
  void didPopNext() {}

  /// Called when the current route has been pushed.
  @override
  void didPush() {}

  /// Called when the current route has been popped off.
  @override
  void didPop() {}

  /// Called when a new route has been pushed, and the current route is no longer visible.
  @override
  void didPushNext() {}
}

/// 基于Getx的基础页面编写对应的基础Controller。
abstract class BasePageGetxController<S extends BasePageBaseState> extends GetxController {
  S? _state;

  S get state => _state ??= initBasePageBaseState();

  S initBasePageBaseState();

  /// 是否需要加载缓存数据
  bool get needLoadCachedData => false;

  /// 是否需要加载数据，如果设置成false，则不会执行主动loadData()方法
  bool get needLoadData => true;

  // 加载实际数据
  Future<void> _loadData(bool isLoadCachedData) async {
    if (isLoadCachedData == false) {
      state.isLoadRealDataSuccess = false;
    }
    await loadData(isLoadCachedData);
    if (isLoadCachedData == false) {
      state.isLoadRealDataSuccess = true;
    }
  }

  /// 加载实际数据，加载缓存数据和加载实际数据应该是要一样的。
  /// [isLoadCachedData] 是否是加载缓存数据 true：加载缓存数据；false：加载真实数据
  Future<void> loadData(bool isLoadCachedData);

  /// 用来重新加载数据的时候使用
  late CachedLoadingBodyController _cachedLoadingBodyController;

  /// 重新加载数据
  void reloadData() {
    _cachedLoadingBodyController.reloadData();
  }

  /// 监听 - 缓存数据加载中...
  void cachedDataLoadingListener() {}

  /// 监听 - 缓存数据加载成功
  void cachedDataLoadedSuccessListener() {}

  /// 监听 - 缓存数据失败
  void cachedDataLoadedFailedListener(dynamic error) {}

  /// 监听 - 实际数据加载中...
  void dataLoadingListener() {}

  /// 监听 - 实际数据加载成功
  void dataLoadedSuccessListener() {}

  /// 监听 - 数据加载失败
  void dataLoadedFailedListener(bool isCachedDataLoadedSuccess, dynamic error) {}

  /// 监听 - 数据重新加载
  void dataReloadListener() {}
}

/// 基于Getx的基础页面编写对应的基础状态。
class BasePageBaseState<T extends BasePageStatefulWidget> {
  late T page;

  bool isLoadRealDataSuccess = false;
}

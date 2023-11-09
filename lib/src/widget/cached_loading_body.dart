import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/util/log_util.dart';

/// 加载流程：加载中 -> 缓存数据（加载失败，忽略错误） -> 实际数据
/// 注意：如果缓存数据需要很长时间，则不适用，一般从本地数据库或者shared_preferences中读取数据。
/// 注意2：一般用于页面级别，如果加载失败，使用toast提示，所以需要支持下拉刷新。
class CachedLoadingBody extends StatefulWidget {
  /// 请求加载数据，例如网络请求，如果设置为null，则说明不需要请求，直接渲染视图
  final Future<void> Function()? loadData;

  /// 加载缓存数据
  final Future<void> Function()? loadCacheData;

  /// 请求加载数据成功后，将渲染该视图
  final Widget Function(BuildContext context) buildBody;

  /// 自定义“加载中”的视图
  final Widget? Function(BuildContext context)? loadingWidgetBuilder;

  /// 自定义“加载失败”的视图
  final Widget? Function(BuildContext context, CachedLoadingBodyController controller, dynamic error)? loadFailedWidgetBuilder;

  /// 监听加载中...
  final void Function()? dataLoadingListener;

  /// 监听加载缓存数据
  final void Function()? dataCacheLoadingListener;

  /// 监听加载缓存数据成功
  final void Function()? dataCacheLoadedSuccessListener;

  /// 监听加载成功
  final void Function()? dataLoadedSuccessListener;

  /// 监听加载失败
  final void Function(bool isCachedSuccess, dynamic error)? dataLoadedFailedListener;

  /// 监听重新加载
  final void Function()? dataReloadListener;

  /// 监听widget创建完成
  final void Function(CachedLoadingBodyController controller)? ondLoadingBodyCreated;

  /// 是否需要淡入的动画，默认false，推荐在页面级别开启
  /// 注意：正常不需要开启，不然会有loading状态，导致误导以为是正常数据的请求
  final bool isAnimated;

  /// 是否需要等待页面跳转的动画显示完成，默认false，推荐在页面级别开启，如果觉得页面跳转的时候卡顿，也可以开启
  /// 注意：正常不需要开启，不然会有loading状态，导致误导以为是正常数据的请求
  final bool isDelayedDisplay;

  const CachedLoadingBody({
    Key? key,
    required this.loadData,
    required this.loadCacheData,
    required this.buildBody,
    this.loadingWidgetBuilder,
    this.loadFailedWidgetBuilder,
    this.dataLoadingListener,
    this.dataCacheLoadingListener,
    this.dataCacheLoadedSuccessListener,
    this.dataLoadedSuccessListener,
    this.dataLoadedFailedListener,
    this.dataReloadListener,
    this.ondLoadingBodyCreated,
    this.isAnimated = false,
    this.isDelayedDisplay = false,
  }) : super(key: key);

  @override
  State<CachedLoadingBody> createState() => _CachedLoadingBodyState();
}

class _CachedLoadingBodyState extends State<CachedLoadingBody> {
  final CachedLoadingBodyController _cachedLoadingBodyController = CachedLoadingBodyController();

  bool isCachedDataSuccess = false;

  @override
  void dispose() {
    _cachedLoadingBodyController._dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _CachedLoadingContent(
      isAnimated: widget.isAnimated,
      isDelayedDisplay: widget.isDelayedDisplay,
      onStateInitListener: (_CachedLoadingContentState state) {
        _cachedLoadingBodyController._setState(state);
        if (widget.ondLoadingBodyCreated != null) {
          widget.ondLoadingBodyCreated!(_cachedLoadingBodyController);
        }
      },
      loadDataGenerator: widget.loadData,
      loadCachedDataGenerator: widget.loadCacheData,
      loadingWidgetBuilder: (BuildContext context) {
        Widget? child;
        if (widget.loadingWidgetBuilder != null) {
          child = widget.loadingWidgetBuilder!(context);
        }
        child ??= _buildDefaultLoadingWidget(context);
        return child;
      },
      loadCachedSuccessWidgetBuilder: (BuildContext context) {
        return widget.buildBody(context);
      },
      loadSuccessWidgetBuilder: (BuildContext context) {
        return widget.buildBody(context);
      },
      loadFailedWidgetBuilder: (BuildContext context, error) {
        if (isCachedDataSuccess) {
          return widget.buildBody(context);
        }
        Widget? child;
        if (widget.loadFailedWidgetBuilder != null) {
          child = widget.loadFailedWidgetBuilder!(context, _cachedLoadingBodyController, error);
        }
        child ??= _buildDefaultLoadFailedWidget(context, error);
        return child;
      },
      dataLoadingListener: widget.dataLoadingListener,
      dataCacheLoadingListener: () {
        isCachedDataSuccess = false;
        if (widget.dataCacheLoadingListener != null) {
          widget.dataCacheLoadingListener!();
        }
      },
      dataCacheLoadedSuccessListener: () {
        isCachedDataSuccess = true;
        if (widget.dataCacheLoadedSuccessListener != null) {
          widget.dataCacheLoadedSuccessListener!();
        }
      },
      dataLoadedSuccessListener: widget.dataLoadedSuccessListener,
      dataLoadedFailedListener: (error) {
        if (widget.dataLoadedFailedListener != null) {
          widget.dataLoadedFailedListener!(isCachedDataSuccess, error);
        }
      },
      dataReloadListener: widget.dataReloadListener,
    );
  }

  /// 默认"加载中"样式
  Widget _buildDefaultLoadingWidget(context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 12,
      ),
    );
  }

  /// 默认"加载失败"样式
  Widget _buildDefaultLoadFailedWidget(BuildContext context, dynamic error) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _cachedLoadingBodyController.reloadData();
      },
      child: Center(
        child: Text(
          '加载数据失败，点击重试',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}

class CachedLoadingBodyController {
  _CachedLoadingContentState? _cachedLoadingContentState;

  void _setState(_CachedLoadingContentState state) {
    _cachedLoadingContentState = state;
  }

  /// 重新加载数据
  void reloadData() {
    _cachedLoadingContentState?.reloadData();
  }

  void _dispose() {
    _cachedLoadingContentState = null;
  }
}

class _CachedLoadingContent extends StatefulWidget {
  final Future<void> Function()? loadDataGenerator;
  final Future<void> Function()? loadCachedDataGenerator;
  final Widget Function(BuildContext context) loadingWidgetBuilder;
  final Widget Function(BuildContext context) loadCachedSuccessWidgetBuilder;
  final Widget Function(BuildContext context) loadSuccessWidgetBuilder;
  final Widget Function(BuildContext context, dynamic error) loadFailedWidgetBuilder;
  final void Function()? dataLoadingListener;
  final void Function()? dataCacheLoadingListener;
  final void Function()? dataCacheLoadedSuccessListener;
  final void Function()? dataLoadedSuccessListener;
  final void Function(dynamic error)? dataLoadedFailedListener;
  final void Function()? dataReloadListener;
  final void Function(_CachedLoadingContentState state)? onStateInitListener;
  final bool isAnimated;
  final bool isDelayedDisplay;

  const _CachedLoadingContent({
    Key? key,
    this.loadDataGenerator,
    this.loadCachedDataGenerator,
    required this.loadingWidgetBuilder,
    required this.loadCachedSuccessWidgetBuilder,
    required this.loadSuccessWidgetBuilder,
    required this.loadFailedWidgetBuilder,
    this.dataLoadingListener,
    this.dataCacheLoadingListener,
    this.dataCacheLoadedSuccessListener,
    this.dataLoadedSuccessListener,
    this.dataLoadedFailedListener,
    this.dataReloadListener,
    this.onStateInitListener,
    this.isAnimated = false,
    this.isDelayedDisplay = false,
  }) : super(key: key);

  @override
  State<_CachedLoadingContent> createState() => _CachedLoadingContentState();
}

class _CachedLoadingContentState extends State<_CachedLoadingContent> with SingleTickerProviderStateMixin {
  static const int addCachedDataLabel = 1;
  static const int addDataLabel = 2;

  Stream<int>? _bids;
  bool isFirstLoadData = true;
  bool isCachedDataSuccess = false;
  late bool _isAnimated;
  late bool _isDelayedDisplay;
  late AnimationController _opacityController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.onStateInitListener != null) {
      widget.onStateInitListener!(this);
    }
    _isAnimated = widget.isAnimated;
    _isDelayedDisplay = widget.isDelayedDisplay;
    if (_isAnimated) {
      _opacityController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
      _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_opacityController);
    }
    _bids = _loadData();
  }

  Stream<int> _loadData() {
    late final StreamController<int> controller;
    controller = StreamController<int>(
      onListen: () async {
        if (isFirstLoadData && _isDelayedDisplay && (widget.loadDataGenerator != null)) {
          isFirstLoadData = false;
          var startDateTime = DateTime.now();
          bool success = await _loadCachedData(controller);
          var loadingDataMilliseconds = DateTime.now().difference(startDateTime).inMilliseconds;
          // MaterialRouteTransitionMixin  Duration get transitionDuration => const Duration(milliseconds: 300);
          var delayDuration = const Duration(milliseconds: 300);
          var diffMilliseconds = delayDuration.inMilliseconds - loadingDataMilliseconds;
          // LogUtil.d(LogUtil.tag, "需要延迟:$diffMilliseconds毫秒..");
          if (diffMilliseconds > 0) {
            await Future.delayed(Duration(milliseconds: diffMilliseconds));
          }
          if (success) {
            controller.add(addCachedDataLabel);
          }
          success = await _loadRealData(controller);
          loadingDataMilliseconds = DateTime.now().difference(startDateTime).inMilliseconds;
          diffMilliseconds = delayDuration.inMilliseconds - loadingDataMilliseconds;
          // LogUtil.d(LogUtil.tag, "需要延迟:$diffMilliseconds毫秒..");
          if (diffMilliseconds > 0) {
            await Future.delayed(Duration(milliseconds: diffMilliseconds));
          }
          if (success) {
            controller.add(addDataLabel);
          }
        } else {
          bool success = await _loadCachedData(controller);
          if (success) {
            controller.add(addCachedDataLabel);
          }
          success = await _loadRealData(controller);
          if (success) {
            controller.add(addDataLabel);
          }
        }
        await controller.close();
      },
    );
    return controller.stream;
  }

  Future<bool> _loadCachedData(StreamController<int> controller) async {
    // 加载缓存数据
    try {
      if (widget.loadCachedDataGenerator != null) {
        _loadingCacheData();
        await widget.loadCachedDataGenerator!();
        _loadCachedDataSuccess();
        return true;
      }
    } catch (e, s) {
      // 加载缓存出错的话，不处理
      LogUtil.e(LogUtil.tag, "加载缓存失败:$e\n$s");
    }
    return false;
  }

  Future<bool> _loadRealData(StreamController<int> controller) async {
    // 加载数据
    try {
      if (widget.loadDataGenerator != null) {
        _loadingData();
        await widget.loadDataGenerator!();
        _loadDataSuccess();
        return true;
      }
    } catch (e, s) {
      _loadDataFailed(e, s);
      controller.addError(e);
    }
    return false;
  }

  void _loadingData() {
    if (widget.dataLoadingListener != null) widget.dataLoadingListener!();
  }

  void _loadingCacheData() {
    isCachedDataSuccess = false;
    if (widget.dataCacheLoadingListener != null) widget.dataCacheLoadingListener!();
  }

  void _loadCachedDataSuccess() {
    isCachedDataSuccess = true;
    if (!mounted) return;
    if (_isAnimated) {
      _opacityController.forward();
    }
    if (widget.dataCacheLoadedSuccessListener != null) widget.dataCacheLoadedSuccessListener!();
  }

  void _loadDataSuccess() {
    if (!mounted) return;
    if (_isAnimated && !isCachedDataSuccess) {
      _opacityController.forward();
    }
    if (widget.dataLoadedSuccessListener != null) widget.dataLoadedSuccessListener!();
  }

  void _loadDataFailed(e, s) {
    if (!mounted) return;
    if (_isAnimated && !isCachedDataSuccess) {
      _opacityController.forward();
    }
    if (widget.dataLoadedFailedListener != null) widget.dataLoadedFailedListener!(e);
  }

  void reloadData() {
    if (!mounted) return;
    if (_isAnimated) {
      _opacityController.reset();
    }
    if (widget.dataReloadListener != null) widget.dataReloadListener!();
    setState(() {
      _bids = _loadData();
    });
  }

  @override
  void dispose() {
    if (_isAnimated) {
      _opacityController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loadDataGenerator == null) {
      return _buildLoadSuccessWidget(context);
    }
    return StreamBuilder<int>(
      stream: _bids,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        // LogUtil.d(LogUtil.tag, "StreamBuilder:$snapshot hasError:${snapshot.hasError}");
        switch (snapshot.connectionState) {
          toSuccess:
          toError:
          case ConnectionState.done:
            Widget child;
            if (snapshot.hasError) {
              child = _buildLoadFailedWidget(context, snapshot.error);
            } else {
              child = _buildLoadSuccessWidget(context);
            }
            if (!_isAnimated || isCachedDataSuccess) return child;
            return AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: child,
                );
              },
              child: child,
            );
          case ConnectionState.active:
            if (snapshot.data == addCachedDataLabel) {
              Widget child = _buildLoadCachedSuccessWidget(context);
              if (!_isAnimated) return child;
              return AnimatedBuilder(
                animation: _opacityAnimation,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: child,
                  );
                },
                child: child,
              );
            } else if (snapshot.data == addDataLabel) {
              continue toSuccess;
            } else if (snapshot.hasError) {
              continue toError;
            } else {
              continue toLoading;
            }
          toLoading:
          case ConnectionState.none:
          case ConnectionState.waiting:
          default:
            return _buildLoadingWidget(context);
        }
      },
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return widget.loadingWidgetBuilder(context);
  }

  Widget _buildLoadCachedSuccessWidget(BuildContext context) {
    return widget.loadCachedSuccessWidgetBuilder(context);
  }

  Widget _buildLoadSuccessWidget(BuildContext context) {
    return widget.loadSuccessWidgetBuilder(context);
  }

  Widget _buildLoadFailedWidget(BuildContext context, error) {
    return widget.loadFailedWidgetBuilder(context, error);
  }
}

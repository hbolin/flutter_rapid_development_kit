import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/utils/log_util.dart';

/// 加载流程：加载中 -> 缓存数据（加载失败，忽略错误） -> 实际数据
/// 注意：如果缓存数据需要很长时间，则不适用，一般从本地数据库或者shared_preferences中读取数据。
/// 注意2：一般用于页面级别，如果加载真实数据失败，使用toast提示，所以页面需要支持下拉刷新，详见[AppBasePageState]。
class CachedLoadingBody extends StatefulWidget {
  /// 加载缓存数据
  final Future<void> Function()? cachedDataLoader;

  /// 请求加载数据，例如网络请求，如果设置为null，则说明不需要请求，直接渲染视图
  final Future<void> Function()? dataLoader;

  /// 请求加载数据成功后，将渲染该视图
  final Widget Function(BuildContext context, bool isCachedData) bodyBuilder;

  /// 自定义“加载中”的视图
  final Widget? Function(BuildContext context)? loadingWidgetBuilder;

  /// 自定义“加载失败”的视图
  final Widget? Function(BuildContext context, CachedLoadingBodyController controller, dynamic error)? loadFailedWidgetBuilder;

  /// 监听加载中...
  final void Function()? dataLoadingListener;

  /// 监听加载缓存数据
  final void Function()? cachedDataLoadingListener;

  /// 监听加载缓存数据成功
  final void Function()? cachedDataLoadedSuccessListener;

  /// 监听加载缓存数据失败
  final void Function(dynamic error)? cachedDataLoadedFailedListener;

  /// 监听加载成功
  final void Function()? dataLoadedSuccessListener;

  /// 监听加载失败
  final void Function(bool isCachedDataLoadedSuccess, dynamic error)? dataLoadedFailedListener;

  /// 监听重新加载
  final void Function()? dataReloadListener;

  /// 监听widget创建完成
  final void Function(CachedLoadingBodyController controller)? onCachedLoadingBodyCreated;

  const CachedLoadingBody({
    Key? key,
    required this.cachedDataLoader,
    required this.dataLoader,
    required this.bodyBuilder,
    this.loadingWidgetBuilder,
    this.loadFailedWidgetBuilder,
    this.dataLoadingListener,
    this.cachedDataLoadingListener,
    this.cachedDataLoadedSuccessListener,
    this.cachedDataLoadedFailedListener,
    this.dataLoadedSuccessListener,
    this.dataLoadedFailedListener,
    this.dataReloadListener,
    this.onCachedLoadingBodyCreated,
  }) : super(key: key);

  @override
  State<CachedLoadingBody> createState() => _CachedLoadingBodyState();
}

class _CachedLoadingBodyState extends State<CachedLoadingBody> {
  final CachedLoadingBodyController _cachedLoadingBodyController = CachedLoadingBodyController();

  bool _isCachedDataLoadedSuccess = false;

  @override
  void dispose() {
    _cachedLoadingBodyController._dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _CachedLoadingContent(
      onStateInitListener: (_CachedLoadingContentState state) {
        _cachedLoadingBodyController._setState(state);
        if (widget.onCachedLoadingBodyCreated != null) {
          widget.onCachedLoadingBodyCreated!(_cachedLoadingBodyController);
        }
      },
      cachedDataLoader: widget.cachedDataLoader,
      dataLoader: widget.dataLoader,
      loadingWidgetBuilder: (BuildContext context) {
        Widget? child;
        if (widget.loadingWidgetBuilder != null) {
          child = widget.loadingWidgetBuilder!(context);
        }
        child ??= buildDefaultLoadingWidget(context);
        return child;
      },
      loadCachedDataSuccessWidgetBuilder: (BuildContext context) {
        return widget.bodyBuilder(context, true);
      },
      loadDataSuccessWidgetBuilder: (BuildContext context) {
        return widget.bodyBuilder(context, false);
      },
      loadDataFailedWidgetBuilder: (BuildContext context, error) {
        if (_isCachedDataLoadedSuccess) {
          return widget.bodyBuilder(context, true);
        }
        Widget? child;
        if (widget.loadFailedWidgetBuilder != null) {
          child = widget.loadFailedWidgetBuilder!(context, _cachedLoadingBodyController, error);
        }
        child ??= buildDefaultLoadFailedWidget(context, error);
        return child;
      },
      cachedDataLoadingListener: () {
        _isCachedDataLoadedSuccess = false;
        if (widget.cachedDataLoadingListener != null) {
          widget.cachedDataLoadingListener!();
        }
      },
      cachedDataLoadedSuccessListener: () {
        _isCachedDataLoadedSuccess = true;
        if (widget.cachedDataLoadedSuccessListener != null) {
          widget.cachedDataLoadedSuccessListener!();
        }
      },
      cachedDataLoadedFailedListener: widget.cachedDataLoadedFailedListener,
      dataLoadingListener: widget.dataLoadingListener,
      dataLoadedSuccessListener: widget.dataLoadedSuccessListener,
      dataLoadedFailedListener: (error) {
        if (widget.dataLoadedFailedListener != null) {
          widget.dataLoadedFailedListener!(_isCachedDataLoadedSuccess, error);
        }
      },
      dataReloadListener: widget.dataReloadListener,
    );
  }

  /// 默认"加载中"样式
  Widget buildDefaultLoadingWidget(context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 12,
      ),
    );
  }

  /// 默认"加载失败"样式
  Widget buildDefaultLoadFailedWidget(BuildContext context, dynamic error) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _cachedLoadingBodyController.reloadData();
      },
      child: Center(
        child: Text(
          '$error', // 这里会涉及到多语言，所以不写死错误信息，直接由error显示出来
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

// ---------------------------- _CachedLoadingContent ----------------------------

class _CachedLoadingContent extends StatefulWidget {
  final Future<void> Function()? cachedDataLoader;
  final Future<void> Function()? dataLoader;
  final Widget Function(BuildContext context) loadingWidgetBuilder;
  final Widget Function(BuildContext context) loadCachedDataSuccessWidgetBuilder;
  final Widget Function(BuildContext context) loadDataSuccessWidgetBuilder;
  final Widget Function(BuildContext context, dynamic error) loadDataFailedWidgetBuilder;
  final void Function()? cachedDataLoadingListener;
  final void Function()? cachedDataLoadedSuccessListener;
  final void Function(dynamic error)? cachedDataLoadedFailedListener;
  final void Function()? dataLoadingListener;
  final void Function()? dataLoadedSuccessListener;
  final void Function(dynamic error)? dataLoadedFailedListener;
  final void Function()? dataReloadListener;
  final void Function(_CachedLoadingContentState state)? onStateInitListener;

  const _CachedLoadingContent({
    Key? key,
    required this.cachedDataLoader,
    required this.dataLoader,
    required this.loadingWidgetBuilder,
    required this.loadCachedDataSuccessWidgetBuilder,
    required this.loadDataSuccessWidgetBuilder,
    required this.loadDataFailedWidgetBuilder,
    this.cachedDataLoadingListener,
    this.cachedDataLoadedSuccessListener,
    this.cachedDataLoadedFailedListener,
    this.dataLoadingListener,
    this.dataLoadedSuccessListener,
    this.dataLoadedFailedListener,
    this.dataReloadListener,
    this.onStateInitListener,
  }) : super(key: key);

  @override
  State<_CachedLoadingContent> createState() => _CachedLoadingContentState();
}

class _CachedLoadingContentState extends State<_CachedLoadingContent> {
  static const int _loadCachedDataSuccessLabel = 1;
  static const int _loadDataSuccessLabel = 2;

  Stream<int>? _bids;

  @override
  void initState() {
    super.initState();
    if (widget.onStateInitListener != null) {
      widget.onStateInitListener!(this);
    }
    _bids = _loadData();
  }

  Stream<int> _loadData() {
    late final StreamController<int> controller;
    controller = StreamController<int>(
      onListen: () async {
        bool success = await _loadCachedData(controller);
        if (success) {
          controller.add(_loadCachedDataSuccessLabel);
        }
        success = await _loadRealData(controller);
        if (success) {
          controller.add(_loadDataSuccessLabel);
        }
        await controller.close();
      },
    );
    return controller.stream;
  }

  // 加载缓存数据
  Future<bool> _loadCachedData(StreamController<int> controller) async {
    try {
      if (widget.cachedDataLoader != null) {
        _loadingCachedData();
        await widget.cachedDataLoader!();
        _loadCachedDataSuccess();
        return true;
      }
    } catch (e, s) {
      // 加载缓存出错的话，不处理，直接去加载真实数据
      _loadCachedDataFailed(e, s);
    }
    return false;
  }

  // 加载数据
  Future<bool> _loadRealData(StreamController<int> controller) async {
    try {
      if (widget.dataLoader != null) {
        _loadingData();
        await widget.dataLoader!();
        _loadDataSuccess();
        return true;
      }
    } catch (e, s) {
      controller.addError(e, s);
      _loadDataFailed(e, s);
    }
    return false;
  }

  void _loadingCachedData() {
    if (widget.cachedDataLoadingListener != null) {
      widget.cachedDataLoadingListener!();
    }
  }

  void _loadCachedDataSuccess() {
    if (!mounted) return;
    if (widget.cachedDataLoadedSuccessListener != null) {
      widget.cachedDataLoadedSuccessListener!();
    }
  }

  void _loadCachedDataFailed(e, s) {
    if (!mounted) return;
    if (widget.cachedDataLoadedFailedListener != null) {
      widget.cachedDataLoadedFailedListener!(e);
    }
  }

  void _loadingData() {
    if (widget.dataLoadingListener != null) {
      widget.dataLoadingListener!();
    }
  }

  void _loadDataSuccess() {
    if (!mounted) return;
    if (widget.dataLoadedSuccessListener != null) {
      widget.dataLoadedSuccessListener!();
    }
  }

  void _loadDataFailed(e, s) {
    if (!mounted) return;
    if (widget.dataLoadedFailedListener != null) {
      widget.dataLoadedFailedListener!(e);
    }
  }

  void reloadData() {
    if (!mounted) return;
    if (widget.dataReloadListener != null) {
      widget.dataReloadListener!();
    }
    setState(() {
      _bids = _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataLoader == null) {
      return _buildLoadSuccessWidget(context);
    }
    return StreamBuilder<int>(
      stream: _bids,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        // StreamBuilder这里是有个bug的，当第二次的时候，是不会清空error和stackTrace的，但是它的状态是waiting，所以直接忽略这个bug。
        // LogUtil.debug("StreamBuilder:$snapshot hasError:${snapshot.hasError}");
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
            return child;
          case ConnectionState.active:
            if (snapshot.data == _loadCachedDataSuccessLabel) {
              return _buildLoadCachedSuccessWidget(context);
            } else if (snapshot.data == _loadDataSuccessLabel) {
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
    return widget.loadCachedDataSuccessWidgetBuilder(context);
  }

  Widget _buildLoadSuccessWidget(BuildContext context) {
    return widget.loadDataSuccessWidgetBuilder(context);
  }

  Widget _buildLoadFailedWidget(BuildContext context, error) {
    return widget.loadDataFailedWidgetBuilder(context, error);
  }
}

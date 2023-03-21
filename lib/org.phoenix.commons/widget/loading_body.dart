import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 加载流程：加载中 -> 加载成功/失败
class LoadingBody extends StatefulWidget {
  /// 请求加载数据，例如网络请求，如果设置为null，则说明不需要请求，直接渲染视图
  final Future<void> Function()? loadData;

  /// 请求加载数据成功后，将渲染该视图
  final Widget Function(BuildContext context) buildBody;

  /// 自定义“加载中”的视图
  final Widget? Function(BuildContext context)? loadingWidgetBuilder;

  /// 自定义“加载失败”的视图
  final Widget? Function(BuildContext context, LoadingBodyController controller, dynamic error)? loadFailedWidgetBuilder;

  /// 监听加载中...
  final void Function()? dataLoadingListener;

  /// 监听加载成功
  final void Function()? dataLoadedSuccessListener;

  /// 监听加载失败
  final void Function(dynamic error)? dataLoadedFailedListener;

  /// 监听重新加载
  final void Function()? dataReloadListener;

  /// 监听widget创建完成
  final void Function(LoadingBodyController controller)? ondLoadingBodyCreated;

  /// 是否需要淡入的动画，默认false
  final bool isAnimated;

  /// 是否需要等待页面跳转的动画显示完成，默认false
  final bool isDelayedDisplay;

  const LoadingBody({
    Key? key,
    required this.loadData,
    required this.buildBody,
    this.loadingWidgetBuilder,
    this.loadFailedWidgetBuilder,
    this.dataLoadingListener,
    this.dataLoadedSuccessListener,
    this.dataLoadedFailedListener,
    this.dataReloadListener,
    this.ondLoadingBodyCreated,
    this.isAnimated = false,
    this.isDelayedDisplay = false,
  }) : super(key: key);

  @override
  State<LoadingBody> createState() => _LoadingBodyState();
}

class _LoadingBodyState extends State<LoadingBody> {
  final LoadingBodyController _loadingBodyController = LoadingBodyController();

  @override
  void dispose() {
    _loadingBodyController._dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _LoadingContent(
      isAnimated: widget.isAnimated,
      isDelayedDisplay: widget.isDelayedDisplay,
      onStateInitListener: (_LoadingContentState state) {
        _loadingBodyController._setState(state);
        if (widget.ondLoadingBodyCreated != null) {
          widget.ondLoadingBodyCreated!(_loadingBodyController);
        }
      },
      loadDataGenerator: widget.loadData,
      loadingWidgetBuilder: (BuildContext context) {
        Widget? child;
        if (widget.loadingWidgetBuilder != null) {
          child = widget.loadingWidgetBuilder!(context);
        }
        child ??= _buildDefaultLoadingWidget(context);
        return child;
      },
      loadSuccessWidgetBuilder: (BuildContext context) {
        return widget.buildBody(context);
      },
      loadFailedWidgetBuilder: (BuildContext context, error) {
        Widget? child;
        if (widget.loadFailedWidgetBuilder != null) {
          child = widget.loadFailedWidgetBuilder!(context, _loadingBodyController, error);
        }
        child ??= _buildDefaultLoadFailedWidget(context, error);
        return child;
      },
      dataLoadingListener: widget.dataLoadingListener,
      dataLoadedSuccessListener: widget.dataLoadedSuccessListener,
      dataLoadedFailedListener: widget.dataLoadedFailedListener,
      dataReloadListener: widget.dataReloadListener,
    );
  }

  /// 默认"加载中"样式
  Widget _buildDefaultLoadingWidget(context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  /// 默认"加载失败"样式
  Widget _buildDefaultLoadFailedWidget(BuildContext context, dynamic error) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _loadingBodyController.reloadData();
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

class LoadingBodyController {
  _LoadingContentState? _loadingContentState;

  void _setState(_LoadingContentState state) {
    _loadingContentState = state;
  }

  /// 重新加载数据
  void reloadData() {
    _loadingContentState?.reloadData();
  }

  void _dispose() {
    _loadingContentState = null;
  }
}

/// 加载流程：加载中 -> 加载成功/失败
class _LoadingContent extends StatefulWidget {
  final Future<void> Function()? loadDataGenerator;
  final Widget Function(BuildContext context) loadingWidgetBuilder;
  final Widget Function(BuildContext context) loadSuccessWidgetBuilder;
  final Widget Function(BuildContext context, dynamic error) loadFailedWidgetBuilder;
  final void Function()? dataLoadingListener;
  final void Function()? dataLoadedSuccessListener;
  final void Function(dynamic error)? dataLoadedFailedListener;
  final void Function()? dataReloadListener;
  final void Function(_LoadingContentState state)? onStateInitListener;
  final bool isAnimated;
  final bool isDelayedDisplay;

  const _LoadingContent({
    Key? key,
    this.loadDataGenerator,
    required this.loadingWidgetBuilder,
    required this.loadSuccessWidgetBuilder,
    required this.loadFailedWidgetBuilder,
    this.dataLoadingListener,
    this.dataLoadedSuccessListener,
    this.dataLoadedFailedListener,
    this.dataReloadListener,
    this.onStateInitListener,
    this.isAnimated = false,
    this.isDelayedDisplay = false,
  }) : super(key: key);

  @override
  State<_LoadingContent> createState() => _LoadingContentState();
}

class _LoadingContentState extends State<_LoadingContent> with SingleTickerProviderStateMixin {
  Future? _futureBuilderFuture;
  bool isFirstLoadData = true;
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
    _futureBuilderFuture = _loadData();
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
    return FutureBuilder(
      future: _futureBuilderFuture,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            Widget child;
            if (snapshot.hasError) {
              child = _buildLoadFailedWidget(context, snapshot.error);
            } else {
              child = _buildLoadSuccessWidget(context);
            }
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
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
          default:
            return _buildLoadingWidget(context);
        }
      },
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return widget.loadingWidgetBuilder(context);
  }

  Widget _buildLoadSuccessWidget(BuildContext context) {
    return widget.loadSuccessWidgetBuilder(context);
  }

  Widget _buildLoadFailedWidget(BuildContext context, error) {
    return widget.loadFailedWidgetBuilder(context, error);
  }

  Future<void> _loadData() async {
    if (widget.loadDataGenerator == null) return;
    try {
      _loadingData();
      if (isFirstLoadData && _isDelayedDisplay) {
        var startDateTime = DateTime.now();
        await widget.loadDataGenerator!();
        var loadingDataMilliseconds = DateTime.now().difference(startDateTime).inMilliseconds;
        // MaterialRouteTransitionMixin  Duration get transitionDuration => const Duration(milliseconds: 300);
        var delayDuration = const Duration(milliseconds: 300);
        var diffMilliseconds = delayDuration.inMilliseconds - loadingDataMilliseconds;
        if (diffMilliseconds > 0) {
          await Future.delayed(Duration(milliseconds: diffMilliseconds));
        }
        isFirstLoadData = false;
      } else {
        await widget.loadDataGenerator!();
      }
      _loadDataSuccess();
    } catch (e, s) {
      _loadDataFailed(e, s);
      rethrow;
    }
  }

  void _loadingData() {
    if (widget.dataLoadingListener != null) widget.dataLoadingListener!();
  }

  void _loadDataSuccess() {
    if (!mounted) return;
    if (_isAnimated) {
      _opacityController.forward();
    }
    if (widget.dataLoadedSuccessListener != null) widget.dataLoadedSuccessListener!();
  }

  void _loadDataFailed(e, s) {
    if (!mounted) return;
    if (_isAnimated) {
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
      _futureBuilderFuture = _loadData();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/widget/cached_loading_body.dart';

/// 基础页面的全局配置
class BasePageGlobalConfig extends InheritedWidget {
  /// 全局默认的“返回按钮”的组件
  final Widget? Function(BuildContext context) defaultAppBarBackButtonBuilder;

  /// 全局默认的“加载中”的组件
  final Widget? Function(BuildContext context, bool isPage, Widget appBarBackButton, Widget? appBarTitle)? defaultLoadingWidgetBuilder;

  /// 全局默认的“加载错误”的组件
  final Widget? Function(
          BuildContext context, bool isPage, Widget appBarBackButton, Widget? appBarTitle, CachedLoadingBodyController controller, dynamic error)?
      defaultErrorWidgetBuilder;

  const BasePageGlobalConfig({
    super.key,
    required this.defaultAppBarBackButtonBuilder,
    required this.defaultLoadingWidgetBuilder,
    required this.defaultErrorWidgetBuilder,
    required super.child,
  });

  static BasePageGlobalConfig? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BasePageGlobalConfig>();
  }

  static BasePageGlobalConfig of(BuildContext context) {
    final BasePageGlobalConfig? result = maybeOf(context);
    assert(result != null, 'No BasePageGlobalTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BasePageGlobalConfig oldWidget) {
    return defaultAppBarBackButtonBuilder != oldWidget.defaultAppBarBackButtonBuilder ||
        defaultLoadingWidgetBuilder != oldWidget.defaultLoadingWidgetBuilder ||
        defaultErrorWidgetBuilder != oldWidget.defaultErrorWidgetBuilder;
  }
}

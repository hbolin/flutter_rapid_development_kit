import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/widget/cached_loading_body.dart';

/// 全局默认的“返回按钮”的组件实现
class BasePageDefaultErrorWidget extends StatelessWidget {
  final bool isPage;
  final Widget appBackButton;
  final CachedLoadingBodyController controller;
  final dynamic error;
  final Widget? defaultErrorWidget;

  const BasePageDefaultErrorWidget({
    super.key,
    required this.isPage,
    required this.appBackButton,
    required this.controller,
    required this.error,
    this.defaultErrorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget? errorWidget = defaultErrorWidget;
    errorWidget ??= GestureDetector(
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
    );

    if (isPage == false) {
      return errorWidget;
    }

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: (parentRoute?.impliesAppBarDismissal ?? false) ? appBackButton : null,
      ),
      body: errorWidget,
    );
  }
}

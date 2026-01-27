import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/page/widgets/default_error_widget.dart';
import 'package:flutter_rapid_development_kit/src/widget/cached_loading_body.dart';

/// 全局默认的“错误”的组件实现
class BasePageDefaultErrorWidget extends StatelessWidget {
  final bool isPage;
  final Widget appBarBackButton;
  final Widget? appBarTitle;
  final CachedLoadingBodyController controller;
  final dynamic error;
  final Widget? defaultErrorWidget;

  const BasePageDefaultErrorWidget({
    super.key,
    required this.isPage,
    required this.appBarBackButton,
    required this.appBarTitle,
    required this.controller,
    required this.error,
    this.defaultErrorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget? errorWidget = defaultErrorWidget;
    errorWidget ??= DefaultErrorWidget(
      error: "$error", // 这里会涉及到多语言，所以不写死错误信息，直接由error显示出来
      onTap: () {
        controller.reloadData();
      },
    );

    if (isPage == false) {
      return errorWidget;
    }

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: (parentRoute?.impliesAppBarDismissal ?? false) ? appBarBackButton : null,
        title: appBarTitle,
      ),
      body: errorWidget,
    );
  }
}

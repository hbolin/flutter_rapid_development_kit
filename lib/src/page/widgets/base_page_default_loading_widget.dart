import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 全局默认的“加载中”的组件实现
class BasePageDefaultLoadingWidget extends StatelessWidget {
  final bool isPage;
  final Widget appBackButton;
  final Widget? defaultLoadingWidget;

  const BasePageDefaultLoadingWidget({
    super.key,
    required this.isPage,
    required this.appBackButton,
    this.defaultLoadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget? loadingWidget = defaultLoadingWidget;
    loadingWidget ??= const Center(
      child: CupertinoActivityIndicator(
        radius: 12,
      ),
    );

    if (isPage == false) {
      return loadingWidget;
    }

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: (parentRoute?.impliesAppBarDismissal ?? false) ? appBackButton : null,
      ),
      body: loadingWidget,
    );
  }
}

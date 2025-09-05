import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/src/page/widgets/default_loading_widget.dart';

/// 全局默认的“加载中”的组件实现
class BasePageDefaultLoadingWidget extends StatelessWidget {
  final bool isPage;
  final Widget appBarBackButton;
  final Widget? appBarTitle;
  final Widget? defaultLoadingWidget;

  const BasePageDefaultLoadingWidget({
    super.key,
    required this.isPage,
    required this.appBarBackButton,
    required this.appBarTitle,
    this.defaultLoadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget? loadingWidget = defaultLoadingWidget;
    loadingWidget ??= const DefaultLoadingWidget();

    if (isPage == false) {
      return loadingWidget;
    }

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: (parentRoute?.impliesAppBarDismissal ?? false) ? appBarBackButton : null,
        title: appBarTitle,
      ),
      body: loadingWidget,
    );
  }
}

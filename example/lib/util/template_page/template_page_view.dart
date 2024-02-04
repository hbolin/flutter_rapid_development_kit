import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'template_page_logic.dart';
import 'template_page_state.dart';

class TemplatePage extends BasePageStatefulWidget {
  const TemplatePage({
    super.key,
    super.getTag,
  });

  factory TemplatePage.fromRouteParas(Map<String, dynamic> json) => TemplatePage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/template";

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends BasePageState<TemplatePageLogic, TemplatePageState, TemplatePage> {
  @override
  TemplatePageLogic initGetxController() => TemplatePageLogic();

  @override
  Widget buildScaffold(BuildContext context, TemplatePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // TODO：
        ],
      ),
    );
  }
}

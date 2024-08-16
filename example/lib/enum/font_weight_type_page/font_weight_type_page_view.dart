import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'font_weight_type_page_logic.dart';
import 'font_weight_type_page_state.dart';

class FontWeightTypePage extends BasePageStatefulWidget {
  const FontWeightTypePage({
    super.key,
    super.getTag,
  });

  factory FontWeightTypePage.fromRouteParas(Map<String, dynamic> json) => FontWeightTypePage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/font_weight_type";

  @override
  State<FontWeightTypePage> createState() => _FontWeightTypePageState();
}

class _FontWeightTypePageState extends BasePageState<FontWeightTypePageLogic, FontWeightTypePageState, FontWeightTypePage> {
  @override
  FontWeightTypePageLogic initGetxController() => FontWeightTypePageLogic();

  @override
  Widget buildScaffold(BuildContext context, FontWeightTypePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "data",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeightType.semibold.fontWeight,
            ),
          ),
          Text(
            "data",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeightType.regular.fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}

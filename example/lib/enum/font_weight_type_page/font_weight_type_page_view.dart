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
  Widget? buildAppBarTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, FontWeightTypePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "FontWeightType.light.fontWeight",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeightType.light.fontWeight,
            ),
          ),
          Text(
            "FontWeightType.regular.fontWeight",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeightType.regular.fontWeight,
            ),
          ),
          Text(
            "FontWeightType.medium.fontWeight",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeightType.medium.fontWeight,
            ),
          ),
          Text(
            "FontWeightType.semibold.fontWeight",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeightType.semibold.fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}

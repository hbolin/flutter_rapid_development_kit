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
    return Text("FontWeightType");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, FontWeightTypePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              "FontWeightType.light.fontWeight",
              style: TextStyle(
                fontWeight: FontWeightType.light.fontWeight,
              ),
            ),
            subtitle: Text(
              "${FontWeightType.light.fontWeight}",
              style: TextStyle(
                fontWeight: FontWeightType.light.fontWeight,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "FontWeightType.regular.fontWeight",
              style: TextStyle(
                fontWeight: FontWeightType.regular.fontWeight,
              ),
            ),
            subtitle: Text(
              "${FontWeightType.regular.fontWeight}",
              style: TextStyle(
                fontWeight: FontWeightType.regular.fontWeight,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "FontWeightType.medium.fontWeight",
              style: TextStyle(
                fontWeight: FontWeightType.medium.fontWeight,
              ),
            ),
            subtitle: Text(
              "${FontWeightType.medium.fontWeight}",
              style: TextStyle(
                fontWeight: FontWeightType.medium.fontWeight,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "FontWeightType.semibold.fontWeight",
              style: TextStyle(
                fontWeight: FontWeightType.semibold.fontWeight,
              ),
            ),
            subtitle: Text(
              "${FontWeightType.semibold.fontWeight}",
              style: TextStyle(
                fontWeight: FontWeightType.semibold.fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

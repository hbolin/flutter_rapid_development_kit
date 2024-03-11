import 'package:example/config/app_font_family_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_font_page_logic.dart';
import 'test_font_page_state.dart';

class TestFontPage extends BasePageStatefulWidget {
  const TestFontPage({
    super.key,
    super.getTag,
  });

  factory TestFontPage.fromRouteParas(Map<String, dynamic> json) => TestFontPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_font";

  @override
  State<TestFontPage> createState() => _TestFontPageState();
}

class _TestFontPageState extends BasePageState<TestFontPageLogic, TestFontPageState, TestFontPage> {
  @override
  TestFontPageLogic initGetxController() => TestFontPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestFontPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "PingFang light 14",
            style: TextStyle(
              fontFamily: AppFontFamilyAsset.pingfang,
              fontWeight: FontWeightType.light.fontWeight,
              fontSize: 14,
            ),
          ),
          Text(
            "PingFang light 18",
            style: TextStyle(
              fontFamily: AppFontFamilyAsset.pingfang,
              fontWeight: FontWeightType.light.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "PingFang regular 18",
            style: TextStyle(
              fontFamily: AppFontFamilyAsset.pingfang,
              fontWeight: FontWeightType.regular.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "普通的字体 regular 14",
            style: TextStyle(
              fontSize: 14,
              // fontWeight: FontWeightType.medium.fontWeight,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "普通的字体 regular 22",
            style: TextStyle(
              fontSize: 22,
              // fontWeight: FontWeightType.medium.fontWeight,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "PingFang regular",
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "中文 PingFang light",
            style: TextStyle(
              fontFamily: AppFontFamilyAsset.pingfang,
              fontWeight: FontWeightType.light.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "中文 PingFang regular",
            style: TextStyle(
              fontFamily: AppFontFamilyAsset.pingfang,
              fontWeight: FontWeightType.regular.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "中文 PingFang medium",
            style: TextStyle(
              fontFamily: AppFontFamilyAsset.pingfang,
              fontWeight: FontWeightType.medium.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "中文 PingFang semibold",
            style: TextStyle(
              fontFamily: AppFontFamilyAsset.pingfang,
              fontWeight: FontWeightType.semibold.fontWeight,
              fontSize: 18,
            ),
          ),
          // ------
          Text(
            "中文 PingFang light",
            style: TextStyle(
              fontWeight: FontWeightType.light.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "中文 PingFang regular",
            style: TextStyle(
              fontWeight: FontWeightType.regular.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "中文 PingFang medium",
            style: TextStyle(
              fontWeight: FontWeightType.medium.fontWeight,
              fontSize: 18,
            ),
          ),
          Text(
            "中文 PingFang semibold",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

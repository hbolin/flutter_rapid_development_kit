import 'package:example/config/app_font_family_asset.dart';
import 'package:example/config/app_image_asset.dart';
import 'package:example/config/icon_font_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_makers_page_logic.dart';
import 'test_makers_page_state.dart';

class TestMakersPage extends BasePageStatefulWidget {
  const TestMakersPage({
    super.key,
    super.getTag,
  });

  factory TestMakersPage.fromRouteParas(Map<String, dynamic> json) => TestMakersPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_makers";

  @override
  State<TestMakersPage> createState() => _TestMakersPageState();
}

class _TestMakersPageState extends BasePageState<TestMakersPageLogic, TestMakersPageState, TestMakersPage> {
  @override
  TestMakersPageLogic initGetxController() => TestMakersPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestMakersPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(IconFontAsset.baotuifuwu),
            Image.asset(AppImageAsset.icon_demo),
            Image.asset(AppImageAsset.jpgs.icon_demo),
            Image.asset(AppImageAsset.pngs.icon_demo),
            const Text(
              "Font",
              style: TextStyle(
                fontFamily: AppFontFamilyAsset.pingfang_sc,
              ),
            ),
            const Text(
              "Font",
              style: TextStyle(
                fontFamily: AppFontFamilyAsset.din_bolditalic,
              ),
            ),
            const Text(
              "Font",
              style: TextStyle(
                fontFamily: AppFontFamilyAsset.iconfont,
              ),
            ),
            const Text(
              "Font",
              style: TextStyle(
                fontFamily: AppFontFamilyAsset.vivaldi,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

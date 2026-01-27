import 'package:example/config/app_image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'convenient_container_page_logic.dart';
import 'convenient_container_page_state.dart';

class ConvenientContainerPage extends BasePageStatefulWidget {
  const ConvenientContainerPage({
    super.key,
    super.getTag,
  });

  factory ConvenientContainerPage.fromRouteParas(Map<String, dynamic> json) => ConvenientContainerPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/convenient_container";

  @override
  State<ConvenientContainerPage> createState() => _ConvenientContainerPageState();
}

class _ConvenientContainerPageState extends BasePageState<ConvenientContainerPageLogic, ConvenientContainerPageState, ConvenientContainerPage> {
  @override
  ConvenientContainerPageLogic initGetxController() => ConvenientContainerPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("ConvenientContainer.convenient");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ConvenientContainerPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          ConvenientContainer.convenient(
            // minHeight: 200,
            // minWidth: 200,
            // minWidth: 200,
            // minHeight: 200,
            maxHeight: 200,
            maxWidth: 200,
            width: 200,
            height: 200,
            // color: Colors.red,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            borderColor: Colors.grey,
            // borderWidth: 30,
            radius: 8,
            gradientAxis: Axis.horizontal,
            // gradientColors: [
            //   Colors.red,
            //   Colors.yellow,
            // ],
            // alignment: Alignment.center,
            backgroundImageAssetPath: AppImageAsset.icon_demo,
            backgroundImageBoxFit: BoxFit.fill,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("///"),
                // SizedBox(width: 700)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

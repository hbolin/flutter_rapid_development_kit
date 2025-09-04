import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'rounded_image_page_logic.dart';
import 'rounded_image_page_state.dart';

class RoundedImagePage extends BasePageStatefulWidget {
  const RoundedImagePage({
    super.key,
    super.getTag,
  });

  factory RoundedImagePage.fromRouteParas(Map<String, dynamic> json) => RoundedImagePage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/rounded_image";

  @override
  State<RoundedImagePage> createState() => _RoundedImagePageState();
}

class _RoundedImagePageState extends BasePageState<RoundedImagePageLogic, RoundedImagePageState, RoundedImagePage> {
  @override
  RoundedImagePageLogic initGetxController() => RoundedImagePageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, RoundedImagePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          RoundedImage(
            imageUrl: 'http://gips3.baidu.com/it/u=2955417155,3171133926&fm=3042&app=3042&f=JPEG&wm=1,huayi,0,0,13,9&wmo=0,0&w=1280&h=960',
            width: 200,
            height: 300,
            radius: 8,
            // boxFit: BoxFit.fill,
          ),
          const SizedBox(height: 20),
          RoundedImage.zero(
            imageUrl: 'http://gips3.baidu.com/it/u=2955417155,3171133926&fm=3042&app=3042&f=JPEG&wm=1,huayi,0,0,13,9&wmo=0,0&w=1280&h=960',
            width: 200,
            height: 300,
            borderColor: Colors.yellow,
            borderWidth: 2,
            customBorderRadius: BorderRadius.circular(80),
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.srcOver,
          ),
        ],
      ),
    );
  }
}

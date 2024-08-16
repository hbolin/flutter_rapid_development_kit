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
  Widget buildScaffold(BuildContext context, ConvenientContainerPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ConvenientContainer.convenient(
            minHeight: 200,
            minWidth: 200,
            color: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            borderColor: Colors.grey,
            borderWidth: 30,
            radius: 8,
            gradientAxis: Axis.horizontal,
            gradientColors: [
              Colors.red,
              Colors.yellow,
            ],
            // alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("///"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

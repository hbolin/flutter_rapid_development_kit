import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'text_visibility_builder_page_logic.dart';
import 'text_visibility_builder_page_state.dart';

class TextVisibilityBuilderPage extends BasePageStatefulWidget {
  const TextVisibilityBuilderPage({
    super.key,
    super.getTag,
  });

  factory TextVisibilityBuilderPage.fromRouteParas(Map<String, dynamic> json) => TextVisibilityBuilderPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/text_visibility_builder";

  @override
  State<TextVisibilityBuilderPage> createState() => _TextVisibilityBuilderPageState();
}

class _TextVisibilityBuilderPageState extends BasePageState<TextVisibilityBuilderPageLogic, TextVisibilityBuilderPageState, TextVisibilityBuilderPage> {
  @override
  TextVisibilityBuilderPageLogic initGetxController() => TextVisibilityBuilderPageLogic();

  late String initialString;

  @override
  Widget buildScaffold(BuildContext context, TextVisibilityBuilderPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Visibility(
          //   visible: false,
          //   child: Text(initialString),
          // ),
          // Opacity(
          //   opacity: 0,
          //   child: Text(initialString),
          // ),
          VisibilityBuilder(
            visible: false,
            builder: (BuildContext context) {
              return Text(initialString);
            },
          ),
        ],
      ),
    );
  }
}

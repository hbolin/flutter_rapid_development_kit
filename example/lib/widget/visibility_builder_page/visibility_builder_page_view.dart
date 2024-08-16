import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'visibility_builder_page_logic.dart';
import 'visibility_builder_page_state.dart';

class VisibilityBuilderPage extends BasePageStatefulWidget {
  const VisibilityBuilderPage({
    super.key,
    super.getTag,
  });

  factory VisibilityBuilderPage.fromRouteParas(Map<String, dynamic> json) => VisibilityBuilderPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/visibility_builder";

  @override
  State<VisibilityBuilderPage> createState() => _VisibilityBuilderPageState();
}

class _VisibilityBuilderPageState extends BasePageState<VisibilityBuilderPageLogic, VisibilityBuilderPageState, VisibilityBuilderPage> {
  @override
  VisibilityBuilderPageLogic initGetxController() => VisibilityBuilderPageLogic();

  bool isVisible = false;

  @override
  Widget buildScaffold(BuildContext context, VisibilityBuilderPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Switch(
              value: isVisible,
              onChanged: (value) {
                setState(() {
                  isVisible = value;
                });
              }),
          VisibilityBuilder(
            visible: isVisible,
            builder: (BuildContext context) {
              return SuccessWidget(text: null);
            },
          )
        ],
      ),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final String? text;

  SuccessWidget({
    super.key,
    this.text,
  }) {
    print(text);
    // assert(text != null);
  }

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "SuccessWidget");
  }
}

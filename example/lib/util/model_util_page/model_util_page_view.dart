import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'model_util_page_logic.dart';
import 'model_util_page_state.dart';

class ModelUtilPage extends BasePageStatefulWidget {
  const ModelUtilPage({
    super.key,
    super.getTag,
  });

  factory ModelUtilPage.fromRouteParas(Map<String, dynamic> json) => ModelUtilPage(
    getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
    // TODO:配置路由参数
  );

  @override
  Map<String, dynamic>? getRouteParas() => {
    // TODO:配置路由参数
  };

  @override
  String getRouteName() => "/model_util";

  @override
  State<ModelUtilPage> createState() => _ModelUtilPageState();
}

class _ModelUtilPageState extends BasePageState<ModelUtilPageLogic, ModelUtilPageState, ModelUtilPage> {
  @override
  ModelUtilPageLogic initGetxController() => ModelUtilPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("ModelUtilPage");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ModelUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          Text(
            "${convertT<double>(
              "66.66",
            ).runtimeType}",
          ),
        ],
      ),
    );
  }
}

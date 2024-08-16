import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'action_util_page_logic.dart';
import 'action_util_page_state.dart';

class ActionUtilPage extends BasePageStatefulWidget {
  const ActionUtilPage({
    super.key,
    super.getTag,
  });

  factory ActionUtilPage.fromRouteParas(Map<String, dynamic> json) => ActionUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/action_util";

  @override
  State<ActionUtilPage> createState() => _ActionUtilPageState();
}

class _ActionUtilPageState extends BasePageState<ActionUtilPageLogic, ActionUtilPageState, ActionUtilPage> {
  @override
  ActionUtilPageLogic initGetxController() => ActionUtilPageLogic();

  @override
  Widget buildScaffold(BuildContext context, ActionUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              bool isDealSuccess = await ActionUtil.dealAction(action: () async {
                await Future.delayed(const Duration(seconds: 5));
              });
              print("isDealSuccess:$isDealSuccess");
            },
            child: const Text("ActionUtil.dealAction"),
          ),
          ElevatedButton(
            onPressed: () async {
              bool isDealSuccess = await ActionUtil.dealAction(action: () async {
                await Future.delayed(const Duration(seconds: 3));
                throw "发生异常";
              });
              print("isDealSuccess:$isDealSuccess");
            },
            child: const Text("ActionUtil.dealAction 发生异常"),
          ),
          ElevatedButton(
            onPressed: () async {
              bool isDealSuccess = await ActionUtil.dealAction(action: () async {
                await Future.delayed(const Duration(seconds: 3));
                throw "发生异常";
              }, onFailed: (error) {
                print("!!!!!!发生异常:$error");
              });
              print("isDealSuccess:$isDealSuccess");
            },
            child: const Text("ActionUtil.dealAction 发生异常"),
          ),
        ],
      ),
    );
  }
}

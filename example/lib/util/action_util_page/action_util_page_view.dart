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
  Widget? buildAppBarTitle(BuildContext context) {
    return Text("ActionUtil");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ActionUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16, width: double.infinity),
          ElevatedButton(
            onPressed: () async {
              bool isDealSuccess = await ActionUtil.dealAction(
                action: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  // LogUtil.debug("代码返回？start");
                  // Get.back();
                  // Navigator.of(context).pop();
                  // LogUtil.debug("代码返回？end");
                  // await Future.delayed(const Duration(seconds: 5));
                  // LogUtil.debug("代码返回？end2");
                },
              );
              LogUtil.debug("isDealSuccess:$isDealSuccess");
            },
            child: const Text("ActionUtil.dealAction"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              bool isDealSuccess = await ActionUtil.dealAction(
                action: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  throw "发生异常";
                },
              );
              LogUtil.debug("isDealSuccess:$isDealSuccess");
            },
            child: const Text("ActionUtil.dealAction 发生异常"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              bool isDealSuccess = await ActionUtil.dealAction(
                action: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  throw "发生异常";
                },
                onFailed: (error) {
                  final snackBar = SnackBar(content: Text('发生异常，自行处理异常：$error'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              );
              LogUtil.debug("isDealSuccess:$isDealSuccess");
            },
            child: const Text("ActionUtil.dealAction 发生异常，自行处理异常"),
          ),
        ],
      ),
    );
  }
}

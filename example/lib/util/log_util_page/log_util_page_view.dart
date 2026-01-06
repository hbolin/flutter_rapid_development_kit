import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'log_util_page_logic.dart';
import 'log_util_page_state.dart';

class LogUtilPage extends BasePageStatefulWidget {
  const LogUtilPage({
    super.key,
    super.getTag,
  });

  factory LogUtilPage.fromRouteParas(Map<String, dynamic> json) => LogUtilPage(
    getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
    // TODO:配置路由参数
  );

  @override
  Map<String, dynamic>? getRouteParas() => {
    // TODO:配置路由参数
  };

  @override
  String getRouteName() => "/log_util";

  @override
  State<LogUtilPage> createState() => _LogUtilPageState();
}

class _LogUtilPageState extends BasePageState<LogUtilPageLogic, LogUtilPageState, LogUtilPage> {
  @override
  LogUtilPageLogic initGetxController() => LogUtilPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return Text("LogUtil");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, LogUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16, width: double.infinity),
          ElevatedButton(
            onPressed: () {
              LogUtil.debug("debug info");
            },
            child: const Text("LogUtil.debug"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              var info = List.generate(512, (index) => index).join(",");
              LogUtil.debug(info, tag: "debug");
            },
            child: const Text("LogUtil.debug 超长字符串/自定义tag"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              LogUtil.error("error info");
            },
            child: const Text("LogUtil.error"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              var info = List.generate(512, (index) => index).join(",");
              LogUtil.error(info, tag: "error");
            },
            child: const Text("LogUtil.error 超长字符串/自定义tag"),
          ),
        ],
      ),
    );
  }
}

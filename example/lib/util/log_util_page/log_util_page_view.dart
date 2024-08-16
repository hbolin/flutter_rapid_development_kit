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
  Widget buildScaffold(BuildContext context, LogUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              LogUtil.debug("debug info");
            },
            child: const Text("LogUtil.debug"),
          ),
          ElevatedButton(
            onPressed: () {
              LogUtil.debug("debug info", tag: "debug");
            },
            child: const Text("LogUtil.debug"),
          ),
          ElevatedButton(
            onPressed: () {
              LogUtil.error("error info");
            },
            child: const Text("LogUtil.error"),
          ),
          ElevatedButton(
            onPressed: () {
              LogUtil.error("error info", tag: "error");
            },
            child: const Text("LogUtil.error"),
          ),
          ElevatedButton(
            onPressed: () {
              LogUtil.error("error info", tag: "error", interruptOnDebugModel: false);
            },
            child: const Text("LogUtil.error"),
          ),
        ],
      ),
    );
  }
}

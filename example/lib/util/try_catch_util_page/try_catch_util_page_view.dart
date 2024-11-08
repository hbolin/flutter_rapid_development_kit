import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'try_catch_util_page_logic.dart';
import 'try_catch_util_page_state.dart';

class TryCatchUtilPage extends BasePageStatefulWidget {
  const TryCatchUtilPage({
    super.key,
    super.getTag,
  });

  factory TryCatchUtilPage.fromRouteParas(Map<String, dynamic> json) => TryCatchUtilPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/try_catch_util";

  @override
  State<TryCatchUtilPage> createState() => _TryCatchUtilPageState();
}

class _TryCatchUtilPageState extends BasePageState<TryCatchUtilPageLogic, TryCatchUtilPageState, TryCatchUtilPage> {
  @override
  TryCatchUtilPageLogic initGetxController() => TryCatchUtilPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TryCatchUtilPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              tryCatchIgnoreError(() {
                print("tryCatchIgnoreError");
              });
            },
            child: const Text("tryCatchIgnoreError"),
          ),
          ElevatedButton(
            onPressed: () {
              tryCatchIgnoreError(() {
                throw "xxx";
              });
            },
            child: const Text("tryCatchIgnoreError"),
          ),
          ElevatedButton(
            onPressed: () {
              tryCatchIgnoreError(() async {
                await Future.delayed(const Duration(seconds: 3));
                throw "xxx";
              });
            },
            child: const Text("tryCatchIgnoreError"),
          ),
          ElevatedButton(
            onPressed: () {
              tryCatchIgnoreError(
                () async {
                  await Future.delayed(const Duration(seconds: 3));
                  throw "xxx";
                }
              );
            },
            child: const Text("tryCatchIgnoreError"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_try_catch_page_logic.dart';
import 'test_try_catch_page_state.dart';

class TestTryCatchPage extends BasePageStatefulWidget {
  const TestTryCatchPage({
    super.key,
    super.getTag,
  });

  factory TestTryCatchPage.fromRouteParas(Map<String, dynamic> json) => TestTryCatchPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_try_catch";

  @override
  State<TestTryCatchPage> createState() => _TestTryCatchPageState();
}

class _TestTryCatchPageState extends BasePageState<TestTryCatchPageLogic, TestTryCatchPageState, TestTryCatchPage> {
  @override
  TestTryCatchPageLogic initGetxController() => TestTryCatchPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestTryCatchPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              print("do");
              throw "error";
              print("do2");
            },
            child: Text("不捕获异常"),
          ),
          TextButton(
            onPressed: () {
              tryCatch((){
                print("do");
                throw "error";
              });
              print("do2");
            },
            child: Text("捕获异常"),
          ),
          TextButton(
            onPressed: () {
              tryCatch((){
                print("do");
                throw "error";
              },interruptOnDebugModel: false);
              print("do2");
            },
            child: Text("捕获异常，不中断"),
          ),
        ],
      ),
    );
  }
}

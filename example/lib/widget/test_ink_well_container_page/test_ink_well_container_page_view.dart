import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_ink_well_container_page_logic.dart';
import 'test_ink_well_container_page_state.dart';

class TestInkWellContainerPage extends BasePageStatefulWidget {
  const TestInkWellContainerPage({
    super.key,
    super.getTag,
  });

  factory TestInkWellContainerPage.fromRouteParas(Map<String, dynamic> json) => TestInkWellContainerPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_ink_well_container";

  @override
  State<TestInkWellContainerPage> createState() => _TestInkWellContainerPageState();
}

class _TestInkWellContainerPageState extends BasePageState<TestInkWellContainerPageLogic, TestInkWellContainerPageState, TestInkWellContainerPage> {
  @override
  TestInkWellContainerPageLogic initGetxController() => TestInkWellContainerPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestInkWellContainerPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWellContainer(
            color: Colors.green,
            padding: const EdgeInsets.all(100),
            margin: const EdgeInsets.all(10),
            radius: 20,
            borderColor: Colors.red,
            borderWidth: 30,
            onTap: () {},
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(10),
              right: Radius.circular(50),
            ),
            child: const Text("xxx"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_convenient_container_page_logic.dart';
import 'test_convenient_container_page_state.dart';

class TestConvenientContainerPage extends BasePageStatefulWidget {
  const TestConvenientContainerPage({
    super.key,
    super.getTag,
  });

  factory TestConvenientContainerPage.fromRouteParas(Map<String, dynamic> json) => TestConvenientContainerPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_convenient_container";

  @override
  State<TestConvenientContainerPage> createState() => _TestConvenientContainerPageState();
}

class _TestConvenientContainerPageState extends BasePageState<TestConvenientContainerPageLogic, TestConvenientContainerPageState, TestConvenientContainerPage> {
  @override
  TestConvenientContainerPageLogic initGetxController() => TestConvenientContainerPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestConvenientContainerPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConvenientContainer.round(
              radius: 20,
              color: Colors.green,
              child: const SizedBox(
                width: 100,
                height: 100,
              ),
            ),
            ConvenientContainer.border(
              borderColor: Colors.red,
              borderWidth: 20,
              color: Colors.blue,
              child: const SizedBox(
                width: 100,
                height: 100,
              ),
            ),
            ConvenientContainer.linearGradient(
              gradientColors: const [
                Colors.green,
                Colors.red,
              ],
              child: const SizedBox(
                width: 100,
                height: 100,
              ),
            ),
            ConvenientContainer.minWidthHeight(
              minWidth: 20,
              minHeight: 30,
              color: Colors.amber,
              child: const SizedBox(
                width: 100,
                height: 100,
              ),
            ),
            ConvenientContainer.convenient(
              color: Colors.orange,
              minHeight: 100,
              minWidth: 100,
              borderWidth: 30,
              borderColor: Colors.blue,
              gradientAxis: Axis.vertical,
              gradientColors: const [
                Colors.black,
                Colors.red,
              ],
              radius: 20,
              child: const SizedBox(
                width: 200,
                height: 200,
              ),
              onTap: () {
                LogUtil.debug("点击了");
              },
              // customBorderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(50),
              //   topRight: Radius.circular(50),
              // ),
            ),
            const SizedBox(width: double.infinity),
          ],
        ),
      ),
    );
  }
}

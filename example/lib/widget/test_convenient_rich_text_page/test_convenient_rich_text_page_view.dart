import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_convenient_rich_text_page_logic.dart';
import 'test_convenient_rich_text_page_state.dart';

class TestConvenientRichTextPage extends BasePageStatefulWidget {
  const TestConvenientRichTextPage({
    super.key,
    super.getTag,
  });

  factory TestConvenientRichTextPage.fromRouteParas(Map<String, dynamic> json) => TestConvenientRichTextPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_convenient_rich_text";

  @override
  State<TestConvenientRichTextPage> createState() => _TestConvenientRichTextPageState();
}

class _TestConvenientRichTextPageState extends BasePageState<TestConvenientRichTextPageLogic, TestConvenientRichTextPageState, TestConvenientRichTextPage> {
  @override
  TestConvenientRichTextPageLogic initGetxController() => TestConvenientRichTextPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestConvenientRichTextPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ConvenientRichText(
            dataList: [
              ConvenientRichTextData(text: "单个", textStyle: const TextStyle(color: Colors.grey)),
            ],
          ),
          ConvenientRichText(
            dataList: [
              ConvenientRichTextData(
                text: "灰色",
                textStyle: const TextStyle(color: Colors.grey),
                onTap: () {
                  print("点击灰色");
                },
              ),
              ConvenientRichTextData(
                text: "绿色",
                textStyle: const TextStyle(color: Colors.green),
              ),
              ConvenientRichTextData(
                text: "蓝色",
                textStyle: const TextStyle(color: Colors.blue),
                onTap: () {
                  print("点击蓝色");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

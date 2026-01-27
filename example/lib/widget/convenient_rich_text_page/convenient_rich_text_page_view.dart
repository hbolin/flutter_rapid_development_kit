import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'convenient_rich_text_page_logic.dart';
import 'convenient_rich_text_page_state.dart';

class ConvenientRichTextPage extends BasePageStatefulWidget {
  const ConvenientRichTextPage({
    super.key,
    super.getTag,
  });

  factory ConvenientRichTextPage.fromRouteParas(Map<String, dynamic> json) => ConvenientRichTextPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/convenient_rich_text";

  @override
  State<ConvenientRichTextPage> createState() => _ConvenientRichTextPageState();
}

class _ConvenientRichTextPageState extends BasePageState<ConvenientRichTextPageLogic, ConvenientRichTextPageState, ConvenientRichTextPage> {
  @override
  ConvenientRichTextPageLogic initGetxController() => ConvenientRichTextPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("ConvenientRichText");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ConvenientRichTextPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ConvenientRichText(
                  textAlign: TextAlign.center,
                  dataList: [
                    ConvenientRichTextData(
                      text: "ConvenientRichTextDataConvenientRichTextData",
                      textStyle: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 24,
                      ),
                      onTap: () {
                        print("1111111111");
                      },
                    ),
                    ConvenientRichTextData(
                      text: "xxx",
                      textStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                      onTap: () {
                        print("222222222");
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

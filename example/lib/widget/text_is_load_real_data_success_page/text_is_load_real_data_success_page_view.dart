import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'text_is_load_real_data_success_page_logic.dart';
import 'text_is_load_real_data_success_page_state.dart';

class TextIsLoadRealDataSuccessPage extends BasePageStatefulWidget {
  const TextIsLoadRealDataSuccessPage({
    super.key,
    super.getTag,
  });

  factory TextIsLoadRealDataSuccessPage.fromRouteParas(Map<String, dynamic> json) => TextIsLoadRealDataSuccessPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/text_is_load_real_data_success";

  @override
  State<TextIsLoadRealDataSuccessPage> createState() => _TextIsLoadRealDataSuccessPageState();
}

class _TextIsLoadRealDataSuccessPageState
    extends BasePageState<TextIsLoadRealDataSuccessPageLogic, TextIsLoadRealDataSuccessPageState, TextIsLoadRealDataSuccessPage> {
  @override
  TextIsLoadRealDataSuccessPageLogic initGetxController() => TextIsLoadRealDataSuccessPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TextIsLoadRealDataSuccessPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "isCachedData:$isCachedData  isLoadRealDataSuccess:${state.isLoadRealDataSuccess}",
          style: const TextStyle(
            // color: Colors.red,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

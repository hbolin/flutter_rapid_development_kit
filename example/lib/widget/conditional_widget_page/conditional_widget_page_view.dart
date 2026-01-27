import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'conditional_widget_page_logic.dart';
import 'conditional_widget_page_state.dart';

class ConditionalWidgetPage extends BasePageStatefulWidget {
  const ConditionalWidgetPage({
    super.key,
    super.getTag,
  });

  factory ConditionalWidgetPage.fromRouteParas(Map<String, dynamic> json) => ConditionalWidgetPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/conditional_widget";

  @override
  State<ConditionalWidgetPage> createState() => _ConditionalWidgetPageState();
}

class _ConditionalWidgetPageState extends BasePageState<ConditionalWidgetPageLogic, ConditionalWidgetPageState, ConditionalWidgetPage> {
  @override
  ConditionalWidgetPageLogic initGetxController() => ConditionalWidgetPageLogic();

  bool isSuccess = false;

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("ConditionalWidget");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ConditionalWidgetPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Column(
        children: [
          Switch(
              value: isSuccess,
              onChanged: (value) {
                setState(() {
                  isSuccess = value;
                });
              }),
          // isSuccess ? SuccessWidget(text: null) : Text("failureWidget"),
          ConditionalWidget(
            isSuccess: isSuccess,
            successWidget: SuccessWidget(text: "null"),
            failureWidget: Text("failureWidget"),
          ),
          ConditionalBuilder(
            isSuccess: isSuccess,
            successBuilder: (BuildContext context) {
              // return SuccessWidget(text: null);
              return Text("successBuilder");
            },
            failureBuilder: (BuildContext context) {
              return Text("failureBuilder");
            },
          ),
        ],
      ),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final String? text;

  SuccessWidget({
    super.key,
    this.text,
  }) {
    print(text);
    // assert(text != null);
  }

  @override
  Widget build(BuildContext context) {
    return Text(text!);
  }
}

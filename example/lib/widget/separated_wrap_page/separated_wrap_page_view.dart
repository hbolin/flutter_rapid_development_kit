import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'separated_wrap_page_logic.dart';
import 'separated_wrap_page_state.dart';

class SeparatedWrapPage extends BasePageStatefulWidget {
  const SeparatedWrapPage({
    super.key,
    super.getTag,
  });

  factory SeparatedWrapPage.fromRouteParas(Map<String, dynamic> json) => SeparatedWrapPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/separated_wrap";

  @override
  State<SeparatedWrapPage> createState() => _SeparatedWrapPageState();
}

class _SeparatedWrapPageState extends BasePageState<SeparatedWrapPageLogic, SeparatedWrapPageState, SeparatedWrapPage> {
  @override
  SeparatedWrapPageLogic initGetxController() => SeparatedWrapPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, SeparatedWrapPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SeparatedWrap(
            itemCount: 101,
            itemBuilder: (BuildContext context, int index) {
              return Container(width: index * 2, child: Text("$index"));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
          ),
        ],
      ),
    );
  }
}

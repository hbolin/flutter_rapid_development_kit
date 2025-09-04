import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'separated_row_page_logic.dart';
import 'separated_row_page_state.dart';

class SeparatedRowPage extends BasePageStatefulWidget {
  const SeparatedRowPage({
    super.key,
    super.getTag,
  });

  factory SeparatedRowPage.fromRouteParas(Map<String, dynamic> json) => SeparatedRowPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/separated_row";

  @override
  State<SeparatedRowPage> createState() => _SeparatedRowPageState();
}

class _SeparatedRowPageState extends BasePageState<SeparatedRowPageLogic, SeparatedRowPageState, SeparatedRowPage> {
  @override
  SeparatedRowPageLogic initGetxController() => SeparatedRowPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, SeparatedRowPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SeparatedRow(
              itemCount: 101,
              itemBuilder: (BuildContext context, int index) {
                return Text("$index");
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
            ),
          ),
        ],
      ),
    );
  }
}

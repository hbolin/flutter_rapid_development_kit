import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'separated_column_page_logic.dart';
import 'separated_column_page_state.dart';

class SeparatedColumnPage extends BasePageStatefulWidget {
  const SeparatedColumnPage({
    super.key,
    super.getTag,
  });

  factory SeparatedColumnPage.fromRouteParas(Map<String, dynamic> json) => SeparatedColumnPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/separated_column";

  @override
  State<SeparatedColumnPage> createState() => _SeparatedColumnPageState();
}

class _SeparatedColumnPageState extends BasePageState<SeparatedColumnPageLogic, SeparatedColumnPageState, SeparatedColumnPage> {
  @override
  SeparatedColumnPageLogic initGetxController() => SeparatedColumnPageLogic();

  @override
  Widget buildScaffold(BuildContext context, SeparatedColumnPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SeparatedColumn(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Text("$index");
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          ),
        ],
      ),
    );
  }
}

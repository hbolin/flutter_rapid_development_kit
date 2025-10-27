import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'column_row_grid_view_page_logic.dart';
import 'column_row_grid_view_page_state.dart';

class ColumnRowGridViewPage extends BasePageStatefulWidget {
  const ColumnRowGridViewPage({
    super.key,
    super.getTag,
  });

  factory ColumnRowGridViewPage.fromRouteParas(Map<String, dynamic> json) => ColumnRowGridViewPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/column_row_grid_view";

  @override
  State<ColumnRowGridViewPage> createState() => _ColumnRowGridViewPageState();
}

class _ColumnRowGridViewPageState extends BasePageState<ColumnRowGridViewPageLogic, ColumnRowGridViewPageState, ColumnRowGridViewPage> {
  @override
  ColumnRowGridViewPageLogic initGetxController() => ColumnRowGridViewPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("ColumnRowGridView");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ColumnRowGridViewPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ColumnRowGridView(
              // itemCount: 6 + 1,
              itemCount: 6,
              crossAxisCount: 2,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 16),
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const Text("???");
                  return const Column(
                    children: [
                      Text("???"),
                    ],
                  );
                }
                return Column(
                  children: [
                    const CircleImage(
                      imageUrl: 'http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960',
                      size: 100,
                    ),
                    SizedBox(height: index * 10),
                    Text("$index"),
                  ],
                );
              },
              horizontalSeparatorBuilder: (BuildContext context, int index) {
                return Container(width: 20, height: 20, color: Colors.yellowAccent);
                return const SizedBox(width: 20);
              },
              verticalSeparatorBuilder: (BuildContext context, int index) {
                return Container(height: 20, color: Colors.red);
                return const SizedBox(height: 10);
              },
            ),
          ],
        ),
      ),
    );
  }
}

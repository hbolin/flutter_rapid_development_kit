import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'list_grid_view_page_logic.dart';
import 'list_grid_view_page_state.dart';

class ListGridViewPage extends BasePageStatefulWidget {
  const ListGridViewPage({
    super.key,
    super.getTag,
  });

  factory ListGridViewPage.fromRouteParas(Map<String, dynamic> json) => ListGridViewPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/list_grid_view";

  @override
  State<ListGridViewPage> createState() => _ListGridViewPageState();
}

class _ListGridViewPageState extends BasePageState<ListGridViewPageLogic, ListGridViewPageState, ListGridViewPage> {
  @override
  ListGridViewPageLogic initGetxController() => ListGridViewPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ListGridViewPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListGridView(
              itemCount: 6 + 1,
              crossAxisCount: 2,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Text("???"),
                    ],
                  );
                }
                return Column(
                  children: [
                    CircleImage(
                      imageUrl: 'http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960',
                      size: 100,
                    ),
                  ],
                );
              },
              horizontalSeparatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 20);
              },
              verticalSeparatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
          Expanded(
            child: buildListGridView(
              context: context,
              itemCount: 6 + 1,
              crossAxisCount: 2,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Text("???"),
                    ],
                  );
                }
                return Column(
                  children: [
                    CircleImage(
                      imageUrl: 'http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960',
                      size: 100,
                    ),
                  ],
                );
              },
              horizontalSeparatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 20);
              },
              verticalSeparatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
          Expanded(
              child: CustomScrollView(
            slivers: [
              buildSliverListGridView(
                context: context,
                itemCount: 6 + 1,
                crossAxisCount: 2,
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        Text("???"),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      CircleImage(
                        imageUrl: 'http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960',
                        size: 100,
                      ),
                    ],
                  );
                },
                horizontalSeparatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 20);
                },
                verticalSeparatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}

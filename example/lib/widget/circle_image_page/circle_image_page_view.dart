import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'circle_image_page_logic.dart';
import 'circle_image_page_state.dart';

class CircleImagePage extends BasePageStatefulWidget {
  const CircleImagePage({
    super.key,
    super.getTag,
  });

  factory CircleImagePage.fromRouteParas(Map<String, dynamic> json) => CircleImagePage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/circle_image";

  @override
  State<CircleImagePage> createState() => _CircleImagePageState();
}

class _CircleImagePageState extends BasePageState<CircleImagePageLogic, CircleImagePageState, CircleImagePage> {
  @override
  CircleImagePageLogic initGetxController() => CircleImagePageLogic();

  @override
  Widget buildScaffold(BuildContext context, CircleImagePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleImage(
              imageUrl: 'http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960',
              size: 300,
            ),
            CircleImage(
              imageUrl: 'http://gips0.baidu.com/it2/u=3602773692,1512483864&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280',
              size: 300,
              boxFit: BoxFit.fill,
              borderWidth: 8,
              borderColor: Colors.red,
              placeholder: Center(
                child: Text(
                  "Loading",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 50,
                  ),
                ),
              ),
              errorWidget: Center(
                child: Text(
                  "ERROR",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 50,
                  ),
                ),
              ),
              backgroundColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

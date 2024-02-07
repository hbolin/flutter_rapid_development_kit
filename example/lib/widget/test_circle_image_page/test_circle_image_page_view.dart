import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_circle_image_page_logic.dart';
import 'test_circle_image_page_state.dart';

class TestCircleImagePage extends BasePageStatefulWidget {
  const TestCircleImagePage({
    super.key,
    super.getTag,
  });

  factory TestCircleImagePage.fromRouteParas(Map<String, dynamic> json) => TestCircleImagePage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_circle_image";

  @override
  State<TestCircleImagePage> createState() => _TestCircleImagePageState();
}

class _TestCircleImagePageState extends BasePageState<TestCircleImagePageLogic, TestCircleImagePageState, TestCircleImagePage> {
  @override
  TestCircleImagePageLogic initGetxController() => TestCircleImagePageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestCircleImagePageLogic logic, bool isCachedData) {
    const String imageUrl =
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F9648279e-d224-472e-af3d-babd2cb420ab%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709884439&t=3ff61039152557e1697b7f89d9cafb80";

    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          CircleImage(
            imageUrl: imageUrl,
            size: 100,
          ),
          CircleImage(
            imageUrl: imageUrl,
            size: 100,
            boxFit: BoxFit.fill,
          ),
          CircleImage(
            imageUrl: imageUrl,
            size: 100,
            boxFit: BoxFit.fitWidth,
          ),
          CircleImage(
            imageUrl: imageUrl,
            size: 100,
            borderColor: Colors.green,
          ),
          CircleImage(
            imageUrl: imageUrl,
            size: 100,
            borderColor: Colors.green,
            borderWidth: 10,
          ),
          CircleImage(
            imageUrl: imageUrl,
            size: 100,
            placeholder: Center(child: Text("Loading")),
          ),
          Text("加载失败"),
          CircleImage(
            imageUrl: "xxx" + imageUrl,
            size: 100,
            borderColor: Colors.red,
          ),
          CircleImage(
            imageUrl: "xxx" + imageUrl,
            size: 100,
            borderColor: Colors.red,
            errorWidget: Center(child: Text("Loaded Failed")),
          ),
        ],
      ),
    );
  }
}

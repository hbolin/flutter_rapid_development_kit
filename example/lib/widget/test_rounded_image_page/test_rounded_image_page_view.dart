import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_rounded_image_page_logic.dart';
import 'test_rounded_image_page_state.dart';

class TestRoundedImagePage extends BasePageStatefulWidget {
  const TestRoundedImagePage({
    super.key,
    super.getTag,
  });

  factory TestRoundedImagePage.fromRouteParas(Map<String, dynamic> json) => TestRoundedImagePage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_rounded_image";

  @override
  State<TestRoundedImagePage> createState() => _TestRoundedImagePageState();
}

class _TestRoundedImagePageState extends BasePageState<TestRoundedImagePageLogic, TestRoundedImagePageState, TestRoundedImagePage> {
  @override
  TestRoundedImagePageLogic initGetxController() => TestRoundedImagePageLogic();

  static const String imageUrl =
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F9648279e-d224-472e-af3d-babd2cb420ab%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1709884439&t=3ff61039152557e1697b7f89d9cafb80";

  @override
  Widget buildScaffold(BuildContext context, TestRoundedImagePageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 0,
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              borderColor: Colors.red,
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              borderColor: Colors.red,
              borderWidth: 10,
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              borderColor: Colors.red,
              borderWidth: 10,
              placeholder: Center(
                child: Text("Loading"),
              ),
            ),
            RoundedImage(
              imageUrl: "xxxx" + imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              borderColor: Colors.red,
              borderWidth: 10,
              placeholder: Center(
                child: Text("Loading"),
              ),
              errorWidget: Center(
                child: Text("Loaded Failed"),
              ),
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              borderColor: Colors.red,
              borderWidth: 10,
              placeholder: Center(
                child: Text("Loading"),
              ),
              errorWidget: Center(
                child: Text("Loaded Failed"),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              borderColor: Colors.red,
              borderWidth: 10,
              placeholder: Center(
                child: Text("Loading"),
              ),
              errorWidget: Center(
                child: Text("Loaded Failed"),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              color: Colors.green,
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              borderColor: Colors.red,
              borderWidth: 10,
              placeholder: Center(
                child: Text("Loading"),
              ),
              errorWidget: Center(
                child: Text("Loaded Failed"),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              backgroundColor: Colors.green,
            ),
            RoundedImage(
              imageUrl: imageUrl,
              width: 200,
              height: 100,
              radius: 16,
              boxFit: BoxFit.fitHeight,
              // borderColor: Colors.red,
              // borderWidth: 10,
              placeholder: Center(
                child: Text("Loading"),
              ),
              errorWidget: Center(
                child: Text("Loaded Failed"),
              ),
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_image_banner_page_logic.dart';
import 'test_image_banner_page_state.dart';

class TestImageBannerPage extends BasePageStatefulWidget {
  const TestImageBannerPage({
    super.key,
    super.getTag,
  });

  factory TestImageBannerPage.fromRouteParas(Map<String, dynamic> json) => TestImageBannerPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/test_image_banner";

  @override
  State<TestImageBannerPage> createState() => _TestImageBannerPageState();
}

class _TestImageBannerPageState extends BasePageState<TestImageBannerPageLogic, TestImageBannerPageState, TestImageBannerPage> {
  @override
  TestImageBannerPageLogic initGetxController() => TestImageBannerPageLogic();

  @override
  Widget buildScaffold(BuildContext context, TestImageBannerPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageBanner(
              height: 200,
              imgUrlList: state.imgUrlList,
            ),
            const SizedBox(height: 20),
            ImageBanner(
              height: 200,
              imgUrlList: state.imgUrlList,
              paginationBuilder: (CarouselController controller, int index, bool isSelected) {
                return DefaultRoundedPagination(isSelected: isSelected);
              },
            ),
            const SizedBox(height: 20),
            ImageBanner(
              height: 200,
              imgUrlList: state.imgUrlList,
              paginationBuilder: (CarouselController controller, int index, bool isSelected) {
                return DefaultRoundedPagination(
                  isSelected: isSelected,
                  selectedPaginationColor: Colors.red,
                  unSelectedPaginationColor: Colors.green,
                );
              },
            ),
            const SizedBox(height: 20),
            ImageBanner(
              height: 200,
              imgUrlList: state.imgUrlList,
              paginationBuilder: (CarouselController controller, int index, bool isSelected) {
                return DefaultCirclePagination(
                  isSelected: isSelected,
                  selectedPaginationColor: Colors.red,
                  unSelectedPaginationColor: Colors.green,
                );
              },
            ),
            const SizedBox(height: 20),
            ImageBanner(
              height: 200,
              imgUrlList: state.imgUrlList,
              paginationBuilder: (CarouselController controller, int index, bool isSelected) {
                return DefaultCirclePagination(
                  isSelected: isSelected,
                  selectedPaginationColor: Colors.red,
                  unSelectedPaginationColor: Colors.green,
                );
              },
              // autoPlay: false,
              autoPlayAnimationDuration: const Duration(seconds: 10),
              autoPlayInterval: const Duration(seconds: 3),
              fit: BoxFit.fill,
              radius: 20,
              placeholder: const Text("加载中..."),
              errorWidget: const Text("加载失败..."),
              onTap: (int index) {
                LogUtil.debug("点击Index:$index");
              },
              controller: state.carouselController,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                state.carouselController.animateToPage(1);
              },
              child: const Text("点击跳转至"),
            ),
          ],
        ),
      ),
    );
  }
}

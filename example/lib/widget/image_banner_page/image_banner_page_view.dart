import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'image_banner_page_logic.dart';
import 'image_banner_page_state.dart';

class ImageBannerPage extends BasePageStatefulWidget {
  const ImageBannerPage({
    super.key,
    super.getTag,
  });

  factory ImageBannerPage.fromRouteParas(Map<String, dynamic> json) => ImageBannerPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => "/image_banner";

  @override
  State<ImageBannerPage> createState() => _ImageBannerPageState();
}

class _ImageBannerPageState extends BasePageState<ImageBannerPageLogic, ImageBannerPageState, ImageBannerPage> {
  @override
  ImageBannerPageLogic initGetxController() => ImageBannerPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return const Text("ImageBanner");
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, ImageBannerPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        leading: appBarBackButton,
        title: appBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ImageBanner(
              height: 440,
              imgUrlList: [
                "http://gips1.baidu.com/it/u=3874647369,3220417986&fm=3028&app=3028&f=JPEG&fmt=auto?w=720&h=1280",
                "http://gips1.baidu.com/it/u=1971954603,2916157720&fm=3028&app=3028&f=JPEG&fmt=auto?w=1920&h=2560",
                "http://gips1.baidu.com/it/u=1746086795,2510875842&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024",
              ],
              paginationBuilder: (CarouselSliderController controller, int index, bool isSelected) {
                // return DefaultCirclePagination(
                //   isSelected: isSelected,
                //   selectedPaginationColor: Colors.red,
                //   unSelectedPaginationColor: Colors.yellowAccent,
                // );
                return DefaultRoundedPagination(
                  isSelected: isSelected,
                  selectedPaginationColor: Colors.red,
                  unSelectedPaginationColor: Colors.yellowAccent,
                );
              },
              radius: 10,
              onTap: (index) {
                print("tap index:$index");
              },
            ),
          ],
        ),
      ),
    );
  }
}

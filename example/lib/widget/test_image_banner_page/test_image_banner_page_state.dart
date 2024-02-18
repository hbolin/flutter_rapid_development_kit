import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

import 'test_image_banner_page_view.dart';

class TestImageBannerPageState extends BasePageBaseState<TestImageBannerPage> {
  TestImageBannerPageState() {
    ///Initialize variables
  }

  final imgUrlList = [
    "https://img.pconline.com.cn/images/upload/upc/tx/photoblog/1906/26/c4/155906964_1561516693850_mthumb.jpg",
    "https://img0.baidu.com/it/u=3316636492,2799302396&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
    "https://img0.baidu.com/it/u=3316636492,2799302396&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
    "https://img0.baidu.com/it/u=3316636492,2799302396&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
    "https://img0.baidu.com/it/u=3316636492,2799302396&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
  ];

  final carouselController = CarouselController();
}

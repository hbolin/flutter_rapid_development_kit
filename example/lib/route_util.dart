import 'package:example/index_page/index_page_view.dart';
import 'package:example/util/test_toast_util2_page/test_toast_util2_page_view.dart';
import 'package:get/get.dart';

class RouteUtil {
  static final List<GetPage> initialPages = [
    GetPage(
      name: const IndexPage().getRouteName(),
      page: () => IndexPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestToastUtil2Page().getRouteName(),
      page: () => TestToastUtil2Page.fromRouteParas(Get.parameters),
    ),
  ];
}

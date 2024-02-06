import 'package:example/index_page/index_page_view.dart';
import 'package:example/util/test_makers_page/test_makers_page_view.dart';
import 'package:example/util/test_toast_util2_page/test_toast_util2_page_view.dart';
import 'package:get/get.dart';

class RouteUtil {
  static String initialRoute = const IndexPage().getRouteName();

  static final List<GetPage> initialPages = [
    GetPage(
      name: initialRoute,
      page: () => IndexPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestToastUtil2Page().getRouteName(),
      page: () => TestToastUtil2Page.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestMakersPage().getRouteName(),
      page: () => TestMakersPage.fromRouteParas(Get.parameters),
    ),
  ];
}

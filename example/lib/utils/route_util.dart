import 'package:example/pages/happy_pay_page/happy_pay_page_view.dart';
import 'package:example/pages/hello_page/hello_page_view.dart';
import 'package:example/pages/test_app_base3_page/test_app_base3_page_view.dart';
import 'package:example/pages/test_app_base4_page/test_app_base4_page_view.dart';
import 'package:get/get.dart';

class RouteUtil {
  static String initialRoute = const TestAppBase3Page().getRouteName();

  static final List<GetPage> initPages = [
    GetPage(
      name: initialRoute,
      page: () => const TestAppBase3Page(),
    ),
    // GetPage(
    //   name: const TestAppBase4Page().getRouteName(),
    //   page: () => TestAppBase4Page.fromRouteParas(Get.parameters),
    // ),
    GetPage(
      name: const TestAppBase4Page().getRouteName(),
      page: () {
        var newPageView4 = TestAppBase4Page.fromRouteParas(Get.parameters);
        print("路由映射获，页面：${newPageView4.runtimeType} hashCode：${newPageView4.hashCode} 参数：${Get.parameters}");
        return newPageView4;
      },
    ),
    GetPage(
      name: const HappyPayPage().getRouteName(),
      page: () => HappyPayPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const HelloPage().getRouteName(),
      page: () => HelloPage.fromRouteParas(Get.parameters),
    ),
  ];
}

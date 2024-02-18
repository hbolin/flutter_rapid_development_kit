import 'package:example/index_page/index_page_view.dart';
import 'package:example/util/test_loading_util_page/test_loading_util_page_view.dart';
import 'package:example/util/test_makers_page/test_makers_page_view.dart';
import 'package:example/util/test_toast_util2_page/test_toast_util2_page_view.dart';
import 'package:example/widget/test_circle_image_page/test_circle_image_page_view.dart';
import 'package:example/widget/test_column_row_grid_view_page/test_column_row_grid_view_page_view.dart';
import 'package:example/widget/test_convenient_container_page/test_convenient_container_page_view.dart';
import 'package:example/widget/test_convenient_rich_text_page/test_convenient_rich_text_page_view.dart';
import 'package:example/widget/test_image_banner_page/test_image_banner_page_view.dart';
import 'package:example/widget/test_ink_well_container_page/test_ink_well_container_page_view.dart';
import 'package:example/widget/test_list_grid_view_page/test_list_grid_view_page_view.dart';
import 'package:example/widget/test_rounded_image_page/test_rounded_image_page_view.dart';
import 'package:example/widget/test_separated_column_page/test_separated_column_page_view.dart';
import 'package:example/widget/test_separated_row_page/test_separated_row_page_view.dart';
import 'package:example/widget/test_separated_wrap_page/test_separated_wrap_page_view.dart';
import 'package:example/widget/text_visibility_builder_page/text_visibility_builder_page_view.dart';
import 'package:get/get.dart';

import 'util/test_action_util_page/test_action_util_page_view.dart';
import 'widget/test_conditional_widget_page/test_conditional_widget_page_view.dart';

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
    GetPage(
      name: const TestLoadingUtilPage().getRouteName(),
      page: () => TestLoadingUtilPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestActionUtilPage().getRouteName(),
      page: () => TestActionUtilPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestCircleImagePage().getRouteName(),
      page: () => TestCircleImagePage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestSeparatedColumnPage().getRouteName(),
      page: () => TestSeparatedColumnPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestSeparatedRowPage().getRouteName(),
      page: () => TestSeparatedRowPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestSeparatedWrapPage().getRouteName(),
      page: () => TestSeparatedWrapPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TextVisibilityBuilderPage().getRouteName(),
      page: () => TextVisibilityBuilderPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestRoundedImagePage().getRouteName(),
      page: () => TestRoundedImagePage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestColumnRowGridViewPage().getRouteName(),
      page: () => TestColumnRowGridViewPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestConditionalWidgetPage().getRouteName(),
      page: () => TestConditionalWidgetPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestConvenientRichTextPage().getRouteName(),
      page: () => TestConvenientRichTextPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestConvenientContainerPage().getRouteName(),
      page: () => TestConvenientContainerPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestImageBannerPage().getRouteName(),
      page: () => TestImageBannerPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestListGridViewPage().getRouteName(),
      page: () => TestListGridViewPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TestInkWellContainerPage().getRouteName(),
      page: () => TestInkWellContainerPage.fromRouteParas(Get.parameters),
    ),
  ];
}

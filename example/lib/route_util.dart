import 'package:example/enum/font_weight_type_page/font_weight_type_page_view.dart';
import 'package:example/extension/date_time_format_page/date_time_format_page_view.dart';
import 'package:example/extension/list_extensions_page/list_extensions_page_view.dart';
import 'package:example/extension/money_format_page/money_format_page_view.dart';
import 'package:example/extension/string_number_converter_page/string_number_converter_page_view.dart';
import 'package:example/index_page/index_page_view.dart';
import 'package:example/util/action_util_page/action_util_page_view.dart';
import 'package:example/util/loading_util_page/loading_util_page_view.dart';
import 'package:example/util/log_util_page/log_util_page_view.dart';
import 'package:example/util/toast_util_page/toast_util_page_view.dart';
import 'package:example/util/try_catch_util_page/try_catch_util_page_view.dart';
import 'package:example/widget/cached_loading_body_page/cached_loading_body_page_view.dart';
import 'package:example/widget/circle_image_page/circle_image_page_view.dart';
import 'package:example/widget/column_row_grid_view_page/column_row_grid_view_page_view.dart';
import 'package:example/widget/conditional_widget_page/conditional_widget_page_view.dart';
import 'package:example/widget/convenient_container_page/convenient_container_page_view.dart';
import 'package:example/widget/convenient_rich_text_page/convenient_rich_text_page_view.dart';
import 'package:example/widget/image_banner_page/image_banner_page_view.dart';
import 'package:example/widget/list_grid_view_page/list_grid_view_page_view.dart';
import 'package:example/widget/loading_body_page/loading_body_page_view.dart';
import 'package:example/widget/rounded_image_page/rounded_image_page_view.dart';
import 'package:example/widget/separated_column_page/separated_column_page_view.dart';
import 'package:example/widget/separated_row_page/separated_row_page_view.dart';
import 'package:example/widget/separated_wrap_page/separated_wrap_page_view.dart';
import 'package:example/widget/visibility_builder_page/visibility_builder_page_view.dart';
import 'package:get/get.dart';

class RouteUtil {
  static String initialRoute = "/";

  static final List<GetPage> initialPages = [
    GetPage(
      name: initialRoute,
      page: () => IndexPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const LogUtilPage().getRouteName(),
      page: () => LogUtilPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ToastUtilPage().getRouteName(),
      page: () => ToastUtilPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ActionUtilPage().getRouteName(),
      page: () => ActionUtilPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const LoadingUtilPage().getRouteName(),
      page: () => LoadingUtilPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const TryCatchUtilPage().getRouteName(),
      page: () => TryCatchUtilPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const FontWeightTypePage().getRouteName(),
      page: () => FontWeightTypePage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const DateTimeFormatPage().getRouteName(),
      page: () => DateTimeFormatPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ListExtensionsPage().getRouteName(),
      page: () => ListExtensionsPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const MoneyFormatPage().getRouteName(),
      page: () => MoneyFormatPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const StringNumberConverterPage().getRouteName(),
      page: () => StringNumberConverterPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const CircleImagePage().getRouteName(),
      page: () => CircleImagePage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ColumnRowGridViewPage().getRouteName(),
      page: () => ColumnRowGridViewPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ConditionalWidgetPage().getRouteName(),
      page: () => ConditionalWidgetPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ConvenientContainerPage().getRouteName(),
      page: () => ConvenientContainerPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ConvenientRichTextPage().getRouteName(),
      page: () => ConvenientRichTextPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ImageBannerPage().getRouteName(),
      page: () => ImageBannerPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const ListGridViewPage().getRouteName(),
      page: () => ListGridViewPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const RoundedImagePage().getRouteName(),
      page: () => RoundedImagePage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const SeparatedColumnPage().getRouteName(),
      page: () => SeparatedColumnPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const SeparatedRowPage().getRouteName(),
      page: () => SeparatedRowPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const SeparatedWrapPage().getRouteName(),
      page: () => SeparatedWrapPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const VisibilityBuilderPage().getRouteName(),
      page: () => VisibilityBuilderPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const CachedLoadingBodyPage().getRouteName(),
      page: () => CachedLoadingBodyPage.fromRouteParas(Get.parameters),
    ),
    GetPage(
      name: const LoadingBodyPage().getRouteName(),
      page: () => LoadingBodyPage.fromRouteParas(Get.parameters),
    ),
  ];
}

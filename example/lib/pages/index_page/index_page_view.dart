import 'package:example/enum/font_weight_type_page/font_weight_type_page_view.dart';
import 'package:example/pages/test_base_page/test_base_page_view.dart';
import 'package:example/route_util.dart';
import 'package:example/util/action_util_page/action_util_page_view.dart';
import 'package:example/util/loading_util_page/loading_util_page_view.dart';
import 'package:example/util/log_util_page/log_util_page_view.dart';
import 'package:example/util/model_util_page/model_util_page_view.dart';
import 'package:example/util/shared_preferences_util_page/shared_preferences_util_page_view.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'index_page_logic.dart';
import 'index_page_state.dart';

class IndexPage extends BasePageStatefulWidget {
  const IndexPage({
    super.key,
    super.getTag,
  });

  factory IndexPage.fromRouteParas(Map<String, dynamic> json) => IndexPage(
        getTag: convertT<String?>(json[BasePageStatefulWidget.getTagKey]),
        // TODO:配置路由参数
      );

  @override
  Map<String, dynamic>? getRouteParas() => {
        // TODO:配置路由参数
      };

  @override
  String getRouteName() => RouteUtil.initialRoute;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends BasePageState<IndexPageLogic, IndexPageState, IndexPage> {
  @override
  IndexPageLogic initGetxController() => IndexPageLogic();

  @override
  Widget? buildAppBarTitle(BuildContext context) {
    return null;
  }

  @override
  Widget buildScaffold(BuildContext context, Widget appBarBackButton, Widget? appBarTitle, IndexPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("FontWeightTypePage"),
              onTap: () {
                Get.toNamed(const FontWeightTypePage(getTag: "_tag").getRoute());
              },
            ),
            ListTile(
              title: const Text("ActionUtilPage"),
              onTap: () {
                Get.toNamed(const ActionUtilPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("LoadingUtilPage"),
              onTap: () {
                Get.toNamed(const LoadingUtilPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("LogUtilPage"),
              onTap: () {
                Get.toNamed(const LogUtilPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ModelUtilPage"),
              onTap: () {
                Get.toNamed(const ModelUtilPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("SharedPreferencesUtil"),
              onTap: () {
                Get.toNamed(const SharedPreferencesUtilPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ToastUtilPage"),
              onTap: () {
                Get.toNamed(const ToastUtilPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("TryCatchUtilPage"),
              onTap: () {
                Get.toNamed(const TryCatchUtilPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("CircleImagePage"),
              onTap: () {
                Get.toNamed(const CircleImagePage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ColumnRowGridViewPage"),
              onTap: () {
                Get.toNamed(const ColumnRowGridViewPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ConditionalWidgetPage"),
              onTap: () {
                Get.toNamed(const ConditionalWidgetPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ConvenientContainerPage"),
              onTap: () {
                Get.toNamed(const ConvenientContainerPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ConvenientRichTextPage"),
              onTap: () {
                Get.toNamed(const ConvenientRichTextPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ImageBannerPage"),
              onTap: () {
                Get.toNamed(const ImageBannerPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("ListGridViewPage"),
              onTap: () {
                Get.toNamed(const ListGridViewPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("RoundedImagePage"),
              onTap: () {
                Get.toNamed(const RoundedImagePage().getRoute());
              },
            ),
            ListTile(
              title: const Text("SeparatedColumnPage"),
              onTap: () {
                Get.toNamed(const SeparatedColumnPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("SeparatedRowPage"),
              onTap: () {
                Get.toNamed(const SeparatedRowPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("SeparatedWrapPage"),
              onTap: () {
                Get.toNamed(const SeparatedWrapPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("VisibilityBuilderPage"),
              onTap: () {
                Get.toNamed(const VisibilityBuilderPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("CachedLoadingBodyPage"),
              onTap: () {
                Get.toNamed(const CachedLoadingBodyPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("LoadingBodyPage"),
              onTap: () {
                Get.toNamed(const LoadingBodyPage().getRoute());
              },
            ),
            ListTile(
              title: const Text("TestBasePage"),
              onTap: () {
                Get.toNamed(const TestBasePage().getRoute());
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Called when the top route has been popped off, and the current route shows up.
  @override
  void didPopNext() {
    LogUtil.debug("${state.runtimeType}:didPopNext");
  }

  /// Called when the current route has been pushed.
  @override
  void didPush() {
    LogUtil.debug("${state.runtimeType}:didPush");
  }

  /// Called when the current route has been popped off.
  @override
  void didPop() {
    LogUtil.debug("${state.runtimeType}:didPop");
  }

  /// Called when a new route has been pushed, and the current route is no longer visible.
  @override
  void didPushNext() {
    LogUtil.debug("${state.runtimeType}:didPushNext");
  }
}

import 'dart:math';

import 'package:example/extension/test_date_time_converter_page/test_date_time_converter_page_view.dart';
import 'package:example/extension/test_list_extensions_page/test_list_extensions_page_view.dart';
import 'package:example/extension/test_money_format_page/test_money_format_page_view.dart';
import 'package:example/extension/test_string_number_converter_page/test_string_number_converter_page_view.dart';
import 'package:example/extension/text_map_page/text_map_page_view.dart';
import 'package:example/util/test_action_util_page/test_action_util_page_view.dart';
import 'package:example/util/test_loading_util_page/test_loading_util_page_view.dart';
import 'package:example/util/test_makers_page/test_makers_page_view.dart';
import 'package:example/util/test_toast_util2_page/test_toast_util2_page_view.dart';
import 'package:example/util/test_toast_util_page/test_toast_util_page_view.dart';
import 'package:example/widget/test_cached_loading_body_page/test_cached_loading_body_page_view.dart';
import 'package:example/widget/test_circle_image_page/test_circle_image_page_view.dart';
import 'package:example/widget/test_column_row_grid_view_page/test_column_row_grid_view_page_view.dart';
import 'package:example/widget/test_conditional_widget_page/test_conditional_widget_page_view.dart';
import 'package:example/widget/test_convenient_container_page/test_convenient_container_page_view.dart';
import 'package:example/widget/test_convenient_rich_text_page/test_convenient_rich_text_page_view.dart';
import 'package:example/widget/test_image_banner_page/test_image_banner_page_view.dart';
import 'package:example/widget/test_rounded_image_page/test_rounded_image_page_view.dart';
import 'package:example/widget/test_separated_column_page/test_separated_column_page_view.dart';
import 'package:example/widget/test_separated_row_page/test_separated_row_page_view.dart';
import 'package:example/widget/test_separated_wrap_page/test_separated_wrap_page_view.dart';
import 'package:example/widget/text_visibility_builder_page/text_visibility_builder_page_view.dart';
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
  String getRouteName() => "/";

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends BasePageState<IndexPageLogic, IndexPageState, IndexPage> {
  @override
  IndexPageLogic initGetxController() => IndexPageLogic();

  @override
  Widget buildScaffold(BuildContext context, IndexPageLogic logic, bool isCachedData) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TestTapItem(
              title: "TestDateTimeConverterPage",
              onTap: () {
                Get.to(() => TestDateTimeConverterPage());
              },
            ),
            TestTapItem(
              title: "TestListExtensionsPage",
              onTap: () {
                Get.to(() => const TestListExtensionsPage());
              },
            ),
            TestTapItem(
              title: "TextMapPage",
              onTap: () {
                Get.to(() => TextMapPage());
              },
            ),
            TestTapItem(
              title: "TestMoneyFormatPage",
              onTap: () {
                Get.to(() => TestMoneyFormatPage());
              },
            ),
            TestTapItem(
              title: "TestStringNumberConverterPage",
              onTap: () {
                Get.to(() => TestStringNumberConverterPage());
              },
            ),
            TestTapItem(
              title: "TestCachedLoadingBodyPage",
              onTap: () {
                Get.to(() => TestCachedLoadingBodyPage());
              },
            ),
            TestTapItem(
              title: "TestToastUtilPage",
              onTap: () {
                Get.to(() => TestToastUtilPage());
              },
            ),
            TestTapItem(
              title: "TestToastUtil2Page",
              onTap: () {
                Get.toNamed(const TestToastUtil2Page().getRoute());
              },
            ),
            TestTapItem(
              title: "TestMakersPage",
              onTap: () {
                Get.toNamed(const TestMakersPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestLoadingUtilPage",
              onTap: () {
                Get.toNamed(const TestLoadingUtilPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestActionUtilPage",
              onTap: () {
                Get.toNamed(const TestActionUtilPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestCircleImagePage",
              onTap: () {
                Get.toNamed(const TestCircleImagePage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestSeparatedColumnPage",
              onTap: () {
                Get.toNamed(const TestSeparatedColumnPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestSeparatedRowPage",
              onTap: () {
                Get.toNamed(const TestSeparatedRowPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestSeparatedWrapPage",
              onTap: () {
                Get.toNamed(const TestSeparatedWrapPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TextVisibilityBuilderPage",
              onTap: () {
                Get.toNamed(const TextVisibilityBuilderPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestRoundedImagePage",
              onTap: () {
                Get.toNamed(const TestRoundedImagePage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestColumnRowGridViewPage",
              onTap: () {
                Get.toNamed(const TestColumnRowGridViewPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestConditionalWidgetPage",
              onTap: () {
                Get.toNamed(const TestConditionalWidgetPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestConvenientRichTextPage",
              onTap: () {
                Get.toNamed(const TestConvenientRichTextPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestConvenientContainerPage",
              onTap: () {
                Get.toNamed(const TestConvenientContainerPage().getRoute());
              },
            ),
            TestTapItem(
              title: "TestImageBannerPage",
              onTap: () {
                Get.toNamed(const TestImageBannerPage().getRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 点击触发点击事件
class TestTapItem extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  const TestTapItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _randomColor(a: 100),
      child: ListTile(
        title: Text(title),
        onTap: () {
          debugPrint('点击触发事件 -- $title');
          onTap();
        },
      ),
    );
  }
}

// 随机颜色
Color _randomColor({int r = 255, int g = 255, int b = 255, a = 255}) {
  if (r == 0 || g == 0 || b == 0) return Colors.black;
  if (a == 0) return Colors.white;
  return Color.fromARGB(
    a,
    r != 255 ? r : Random.secure().nextInt(r),
    g != 255 ? g : Random.secure().nextInt(g),
    b != 255 ? b : Random.secure().nextInt(b),
  );
}

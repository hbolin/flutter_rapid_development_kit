import 'dart:math';

import 'package:example/test/util/test_log_util_page.dart';
import 'package:example/test/widget/test_cached_loding_body_page.dart';
import 'package:example/test/widget/test_convenient_container_page.dart';
import 'package:example/test/widget/test_convenient_rich_text_page.dart';
import 'package:example/test/widget/test_image_banner_page.dart';
import 'package:example/test/widget/test_ink_well_container_page.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page.dart';
import 'package:example/test/widget/test_circle_image_page.dart';
import 'package:example/test/widget/test_list_grid_view_page.dart';
import 'package:example/test/widget/test_loading_page.dart';
import 'package:example/test/widget/test_rounded_image_page.dart';
import 'package:example/test/widget/test_separated_row_column_wrap_page.dart';
import 'package:example/test/widget/test_spacer_page.dart';
import 'package:example/test/widget/test_visibility_builder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestMainPage extends StatefulWidget {
  const TestMainPage({Key? key}) : super(key: key);

  @override
  State<TestMainPage> createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
  bool _conditional = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("测试页")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TestTapItem(
              title: "LoadingBody",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage()));
              },
            ),
            TestTapItem(
              title: "CachedLoadingBody",
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestCachedLoadingBodyPage()));
              },
            ),
            TestTapItem(
              title: "CircleImage",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestCircleImagePage()));
              },
            ),
            ConditionalBuilder(
              isSuccess: _conditional,
              successBuilder: (context) {
                return const Text('成功');
              },
              failureBuilder: (context) {
                return const Text('失败');
              },
            ),
            ConditionalWidget(
              isSuccess: _conditional,
              successWidget: const Text('成功'),
              failureWidget: const Text('失败'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _conditional = !_conditional;
                });
              },
              child: const Text('点击切换状态'),
            ),
            TestTapItem(
              title: "VisibilityBuilder",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestVisibilityBuilderPage()));
              },
            ),
            TestTapItem(
              title: "ConvenientContainer",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestConvenientContainerPage()));
              },
            ),
            TestTapItem(
              title: "InkWellContainer",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestInkWellContainerPage()));
              },
            ),
            TestTapItem(
              title: "ConvenientRichText",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestConvenientRichTextPage()));
              },
            ),
            TestTapItem(
              title: "RoundedImage",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestRoundedImagePage()));
              },
            ),
            TestTapItem(
              title: "ImageBanner",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestImageBannerPage()));
              },
            ),
            const ConvenientText(
              '便利性字体',
              color: Colors.red,
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
            TestTapItem(
              title: "SeparatedColumn - SeparatedRow - SeparatedWrap",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestSeparatedRowColumnWrapPage()));
              },
            ),
            TestTapItem(
              title: "loading...",
              onTap: () async {
                LoadingDialogUtil.show(context);
                await Future.delayed(const Duration(seconds: 3));
                LoadingDialogUtil.dismiss(context);
              },
            ),
            TestTapItem(
              title: "loading... on dark theme",
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingPage()));
              },
            ),
            TestTapItem(
              title: "ActionUtil.dealAction",
              onTap: () async {
                var isDealSuccess = await ActionUtil.dealAction(
                  context: context,
                  action: () async {
                    await Future.delayed(const Duration(seconds: 3));
                    throw "处理失败";
                    return "处理成功的数据";
                  },
                  onSuccess: (data) {
                    print('处理成功后数据:${data}');
                  },
                  onFailed: (error) {
                    // throw '???';
                    print('处理成功失败的错误:${error}');
                  },
                );
                print("是否处理成功:$isDealSuccess");
              },
            ),
            TestTapItem(
              title: "日志打印",
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestTestLogUtilPage()));
              },
            ),
            TestTapItem(
              title: "测试Spacer",
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestSpacerPage()));
              },
            ),
            TestTapItem(
              title: "测试ListGridView",
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestListGirdViewPage()));
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

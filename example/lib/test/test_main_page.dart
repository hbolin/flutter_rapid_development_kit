import 'dart:math';

import 'package:example/test/widget/test_convenient_container_page.dart';
import 'package:example/test/widget/test_convenient_rich_text_page.dart';
import 'package:example/test/widget/test_image_banner_page.dart';
import 'package:example/test/widget/test_ink_well_container_page.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page.dart';
import 'package:example/test/widget/test_circle_image_page.dart';
import 'package:example/test/widget/test_rounded_image_page.dart';
import 'package:example/test/widget/test_separated_row_column_wrap_page.dart';
import 'package:example/test/widget/test_visibility_builder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestMainPage extends StatefulWidget {
  const TestMainPage({Key? key}) : super(key: key);

  @override
  State<TestMainPage> createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
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
              title: "CircleImage",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestCircleImagePage()));
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

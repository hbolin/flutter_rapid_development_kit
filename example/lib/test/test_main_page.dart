import 'dart:math';

import 'package:example/test/widget/convenient_container/test_convenient_container_page.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page.dart';
import 'package:example/test/widget/visibility_builder/test_visibility_builder_page.dart';
import 'package:flutter/material.dart';

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

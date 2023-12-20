import 'dart:math';

import 'package:example/pages/test_app_base_page/test_app_base_page_view.dart';
import 'package:example/utils/test_log_util_page.dart';
import 'package:example/utils/test_toast_util_page.dart';
import 'package:example/widgets/cache_loading_body/test_cache_loading_body_page.dart';
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
              title: "CachedLoadingBody",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestCacheLoadingBodyPage()));
              },
            ),
            TestTapItem(
              title: "LogUtil",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLogUtilPage()));
              },
            ),
            TestTapItem(
              title: "ToastUtil",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestToastUtilPage()));
              },
            ),
            TestTapItem(
              title: "TestAppBasePage",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestAppBasePage()));
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
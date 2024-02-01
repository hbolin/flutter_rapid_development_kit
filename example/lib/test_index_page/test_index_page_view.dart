import 'dart:math';

import 'package:example/extension/test_date_time_converter_page/test_date_time_converter_page_view.dart';
import 'package:example/extension/test_list_extensions_page/test_list_extensions_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_index_page_logic.dart';

class TestIndexPage extends StatelessWidget {
  TestIndexPage({Key? key}) : super(key: key);

  final logic = Get.put(TestIndexPageLogic());
  final state = Get.find<TestIndexPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter rapid development kit"),
      ),
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

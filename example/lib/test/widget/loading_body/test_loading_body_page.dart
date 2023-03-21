import 'package:example/test/test_main_page.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_1.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_2.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_3.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_4.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_5.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_6.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_7.dart';
import 'package:example/test/widget/loading_body/test_loading_body_page_8.dart';
import 'package:flutter/material.dart';

class TestLoadingBodyPage extends StatefulWidget {
  const TestLoadingBodyPage({Key? key}) : super(key: key);

  @override
  State<TestLoadingBodyPage> createState() => _TestLoadingBodyPageState();
}

class _TestLoadingBodyPageState extends State<TestLoadingBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoadingBody - 测试")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TestTapItem(
              title: "LoadingBody - 不需要加载数据",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_1()));
              },
            ),
            TestTapItem(
              title: "LoadingBody - 需要加载数据",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_2()));
              },
            ),
            TestTapItem(
              title: "LoadingBody - 需要加载数据，需要显示渐变动画",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_3()));
              },
            ),
            TestTapItem(
              title: "LoadingBody - 需要加载数据，需要延迟显示",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_4()));
              },
            ),
            TestTapItem(
              title: "LoadingBody - 需要加载数据，不需要延迟显示",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_5()));
              },
            ),
            TestTapItem(
              title: "LoadingBody - 自定义加载中组件，并且加载失败",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_6()));
              },
            ),
            TestTapItem(
              title: "LoadingBody - 自定义加载失败组件",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_7()));
              },
            ),
            TestTapItem(
              title: "LoadingBody - 监听",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TestLoadingBodyPage_8()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

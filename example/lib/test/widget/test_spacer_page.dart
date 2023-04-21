import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestSpacerPage extends StatefulWidget {
  const TestSpacerPage({Key? key}) : super(key: key);

  @override
  State<TestSpacerPage> createState() => _TestSpacerPageState();
}

class _TestSpacerPageState extends State<TestSpacerPage> {
  static const _headUrl = "https://img1.baidu.com/it/u=413643897,2296924942&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spacer - 测试"),
      ),
      body: Column(
        children: [
          const ConvenientSpacer.vertical(vertical: 100),
          const Text('顶部间隔为10'),
          Row(
            children: const [
              ConvenientSpacer.horizontal(horizontal: 100),
              Text('左边间隔为10'),
            ],
          ),
          const ConvenientSpacer(flex: 1),
          const Text('中间部分被全部占用'),
        ],
      ),
    );
  }
}

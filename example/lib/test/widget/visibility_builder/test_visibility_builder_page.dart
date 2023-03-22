import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestVisibilityBuilderPage extends StatefulWidget {
  const TestVisibilityBuilderPage({Key? key}) : super(key: key);

  @override
  State<TestVisibilityBuilderPage> createState() => _TestVisibilityBuilderPageState();
}

class _TestVisibilityBuilderPageState extends State<TestVisibilityBuilderPage> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("VisibilityBuilder - 测试")),
      body: Column(
        children: [
          VisibilityBuilder(
            visible: _visible,
            builder: (BuildContext context) {
              print('VisibilityBuilder - 创建了视图');
              return const Text('可见');
            },
          ),
          Visibility(
              visible: _visible,
              child: () {
                print('Visibility - 创建了视图');
                return const Text('可见');
              }()),
          TextButton(
            onPressed: () {
              setState(() {
                print('点击切换状态');
                _visible = !_visible;
              });
            },
            child: Text("点击切换状态:$_visible"),
          ),
        ],
      ),
    );
  }
}

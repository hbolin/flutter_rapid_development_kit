import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestInkWellContainerPage extends StatefulWidget {
  const TestInkWellContainerPage({Key? key}) : super(key: key);

  @override
  State<TestInkWellContainerPage> createState() => _TestInkWellContainerPageState();
}

class _TestInkWellContainerPageState extends State<TestInkWellContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("InkWellContainer - 测试")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 设置圆角
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWellContainer(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                color: Colors.teal,
                // width: 100,
                // height: 100,
                alignment: Alignment.center,
                radius: 20,
                borderWidth: 20,
                borderColor: Colors.red,
                child: const Text('xxxx'),
                onTap: () {
                  print('点击 -- InkWellContainer');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

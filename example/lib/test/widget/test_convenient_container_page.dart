import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestConvenientContainerPage extends StatefulWidget {
  const TestConvenientContainerPage({Key? key}) : super(key: key);

  @override
  State<TestConvenientContainerPage> createState() => _TestConvenientContainerPageState();
}

class _TestConvenientContainerPageState extends State<TestConvenientContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ConvenientContainer - 测试")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 设置圆角
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConvenientContainer.round(
                color: Colors.grey,
                width: 100,
                height: 100,
                alignment: Alignment.center,
                // padding: const EdgeInsets.all(33),
                radius: 20,
                child: const Text('xxxx'),
              ),
            ),
            // 设置边框
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConvenientContainer.border(
                color: Colors.grey,
                padding: const EdgeInsets.all(33),
                borderColor: Colors.green,
                borderWidth: 5,
                radius: 20,
                child: const Text('xxxx'),
              ),
            ),
            // 设置渐变色
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConvenientContainer.linearGradient(
                padding: const EdgeInsets.all(33),
                gradientColors: const [Colors.red, Colors.green],
                child: const Text('xxxx'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConvenientContainer.linearGradient(
                gradientAxis: Axis.vertical,
                padding: const EdgeInsets.all(33),
                gradientColors: const [Colors.red, Colors.green],
                child: const Text('xxxx'),
              ),
            ),
            // 设置最小宽高
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConvenientContainer.minWidthHeight(
                minWidth: 100,
                minHeight: 100,
                color: Colors.grey,
                child: const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text('xxxx'),
                ),
              ),
            ),
            // 快捷设置
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConvenientContainer.convenient(
                    color: Colors.grey,
                    borderColor: Colors.red,
                    borderWidth: 5,
                    gradientColors: const [Colors.greenAccent, Colors.black],
                    gradientAxis: Axis.horizontal,
                    minHeight: 100,
                    minWidth: 100,
                    alignment: Alignment.center,
                    // width: 50,
                    // height: 50,
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('xxx'),
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   color: Colors.red,
            //   alignment: Alignment.center,
            //   child: Text('xxxx'),
            // )
          ],
        ),
      ),
    );
  }
}

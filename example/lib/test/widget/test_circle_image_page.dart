import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestCircleImagePage extends StatefulWidget {
  const TestCircleImagePage({Key? key}) : super(key: key);

  @override
  State<TestCircleImagePage> createState() => _TestCircleImagePageState();
}

class _TestCircleImagePageState extends State<TestCircleImagePage> {
  static const _headUrl = "https://img1.baidu.com/it/u=413643897,2296924942&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CircleImage - 测试"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleImage(
                size: 100,
                imageUrl: _headUrl,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                borderWidth: 5.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                borderWidth: 5.0,
                boxFit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                borderWidth: 5.0,
                boxFit: BoxFit.contain,
                placeholder: CircularProgressIndicator(),
                errorWidget: Center(child: Text('加载失败')),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleImage(
                size: 100,
                imageUrl: "xxxx" + _headUrl,
                borderColor: Colors.red,
                borderWidth: 5.0,
                boxFit: BoxFit.contain,
                placeholder: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
                errorWidget: Center(child: Text('加载失败')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

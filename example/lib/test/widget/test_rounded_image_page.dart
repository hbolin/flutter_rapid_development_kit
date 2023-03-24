import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestRoundedImagePage extends StatefulWidget {
  const TestRoundedImagePage({Key? key}) : super(key: key);

  @override
  State<TestRoundedImagePage> createState() => _TestRoundedImagePageState();
}

class _TestRoundedImagePageState extends State<TestRoundedImagePage> {
  static const _headUrl = "https://img1.baidu.com/it/u=413643897,2296924942&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RoundedImage - 测试"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedImage(
                size: 100,
                imageUrl: _headUrl,
                radius: 8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                radius: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                borderWidth: 5.0,
                radius: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                borderWidth: 9.0,
                radius: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                borderWidth: 5.0,
                boxFit: BoxFit.contain,
                radius: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedImage(
                size: 100,
                imageUrl: _headUrl,
                borderColor: Colors.red,
                borderWidth: 5.0,
                boxFit: BoxFit.contain,
                placeholder: CircularProgressIndicator(),
                errorWidget: Center(child: Text('加载失败')),
                radius: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedImage(
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
                radius: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

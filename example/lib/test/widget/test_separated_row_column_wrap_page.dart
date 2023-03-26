import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestSeparatedRowColumnWrapPage extends StatefulWidget {
  const TestSeparatedRowColumnWrapPage({Key? key}) : super(key: key);

  @override
  State<TestSeparatedRowColumnWrapPage> createState() => _TestSeparatedRowColumnWrapPageState();
}

class _TestSeparatedRowColumnWrapPageState extends State<TestSeparatedRowColumnWrapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SeparatedColumn - SeparatedRow - SeparatedWrap - 测试"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SeparatedRow(
              itemCount: 5,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              itemBuilder: (BuildContext context, int index) {
                return ConvenientText(
                  '数据:$index',
                  fontSize: 10,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return ConvenientText(
                  ' space:$index ',
                  fontSize: 3,
                );
              },
            ),
            SeparatedColumn(
              itemCount: 5,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.end,
              itemBuilder: (BuildContext context, int index) {
                return ConvenientText(
                  '数据:$index',
                  fontSize: 10,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return ConvenientText(
                  ' space:$index ',
                  fontSize: 3,
                );
              },
            ),
            SeparatedWrap(
              itemCount: 5,
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 10,
              itemBuilder: (BuildContext context, int index) {
                return ConvenientText(
                  '数据:$index',
                  fontSize: 10,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return ConvenientText(
                  ' space:$index ',
                  fontSize: 3,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

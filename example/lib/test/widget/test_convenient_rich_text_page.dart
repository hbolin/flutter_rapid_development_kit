import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestConvenientRichTextPage extends StatefulWidget {
  const TestConvenientRichTextPage({Key? key}) : super(key: key);

  @override
  State<TestConvenientRichTextPage> createState() => _TestConvenientRichTextPageState();
}

class _TestConvenientRichTextPageState extends State<TestConvenientRichTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('ConvenientRichText - 测试'),
      ),
      body: Center(
        child: ConvenientRichText(
          dataList: [
            ConvenientRichTextData(text: 'Hello ', color: Colors.black, fontSize: 20.0),
            ConvenientRichTextData(text: 'Flutter ', color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
            ConvenientRichTextData(text: ' RichText', color: Colors.red, fontSize: 20.0, fontStyle: FontStyle.italic),
          ],
        ),
      ),
    );
  }
}

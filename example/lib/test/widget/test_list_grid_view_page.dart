import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

class TestListGirdViewPage extends StatefulWidget {
  const TestListGirdViewPage({Key? key}) : super(key: key);

  @override
  State<TestListGirdViewPage> createState() => _TestListGirdViewPageState();
}

class _TestListGirdViewPageState extends State<TestListGirdViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test ListGridView"),
      ),
      body: ListGridView(
        itemCount: 101,
        crossAxisCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Center(child: Text('${index + 1}'));
        },
        horizontalSeparatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10, height: 10, child: Container(color: Colors.black));
        },
        verticalSeparatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20, child: Container(color: Colors.green));
        },
      ),
    );
  }
}

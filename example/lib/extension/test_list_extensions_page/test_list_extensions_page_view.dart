import 'package:flutter/material.dart';
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:get/get.dart';

import 'test_list_extensions_page_logic.dart';

class TestListExtensionsPage extends StatefulWidget {
  const TestListExtensionsPage({super.key});

  @override
  State<TestListExtensionsPage> createState() => _TestListExtensionsPageState();
}

class _TestListExtensionsPageState extends State<TestListExtensionsPage> {
  final logic = Get.put(TestListExtensionsPageLogic());
  final state = Get.find<TestListExtensionsPageLogic>().state;

  List<_Model> list_1 = [];
  List<_Model> list_2 = [];

  String result = "";

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      list_1.add(_Model(i, "list_1_$i"));
    }

    for (int i = 5; i < 15; i++) {
      list_2.add(_Model(i, "list_2_$i"));
    }
    list_2.add(_Model(0, "list_2_0"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(result),
            FilledButton(
              onPressed: () {
                var list_3 = list_1.union(list_2, (e1, e2) {
                  return e1.index == e2.index;
                });
                setState(() {
                  result = "list_1:$list_1\nlist_2:$list_2\nlist_3:$list_3";
                });
              },
              child: const Text("ListExtensions.union"),
            ),
            FilledButton(
              onPressed: () {
                var list_3 = list_1.subtract(list_2, (e1, e2) {
                  return e1.index == e2.index;
                });
                setState(() {
                  result = "list_1:$list_1\nlist_2:$list_2\nlist_3:$list_3";
                });
              },
              child: const Text("ListExtensions.subtract"),
            ),
            FilledButton(
              onPressed: () {
                var list_3 = list_1.intersect(list_2, (e1, e2) {
                  return e1.index == e2.index;
                });
                setState(() {
                  result = "list_1:$list_1\nlist_2:$list_2\nlist_3:$list_3";
                });
              },
              child: const Text("ListExtensions.intersect"),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  result = "list_1:${list_1.indexOrNull(2)}";
                });
              },
              child: const Text("ListExtensions.indexOrNull(2)"),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  result = "list_1:${list_1.indexOrNull(-1)}";
                });
              },
              child: const Text("ListExtensions.indexOrNull(-1)"),
            ),
            FilledButton(
              onPressed: () {
                setState(() {
                  result = "list_1:${list_1.indexOrNull(10)}";
                });
              },
              child: const Text("ListExtensions.indexOrNull(10)"),
            ),
          ],
        ),
      ),
    );
  }
}

class _Model {
  final int index;
  final String name;

  _Model(this.index, this.name);

  @override
  String toString() {
    return '_Model{index: $index, name: $name, hashCode:$hashCode}\n';
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_map_page_logic.dart';

class TextMapPage extends StatelessWidget {
  TextMapPage({Key? key}) : super(key: key);

  final logic = Get.put(TextMapPageLogic());
  final state = Get.find<TextMapPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    var maps = {
      "a": "a",
      "b": "b",
    };
    return Scaffold(
      body: Column(
        children: [
          Text('''
maps:$maps
maps["a"]:${maps["a"]} 
maps["b"]:${maps["b"]} 
maps["c"]:${maps["c"]}
'''),
        ],
      ),
    );
  }
}

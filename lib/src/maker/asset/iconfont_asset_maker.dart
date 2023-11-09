import 'dart:convert';
import 'dart:io';

// IconFontAssetMaker.makeIconFontClass(
//   directoryPath: '文档/font_4147926_gu987zbb50t',
//   targetFile: 'lib/config/icon_font.dart',
// );
class IconFontAssetMaker {
  static Future<void> makeIconFontClass({
    required String directoryPath,
    required String targetFile,
    String className = "IconFontAsset",
  }) async {
    // 读取目录
    var directory = Directory(directoryPath);
    if (directory.existsSync() != true) {
      throw "目录不存在：$directoryPath";
    }
    var iconfontFile = File("${directory.path}/iconfont.json");
    if (iconfontFile.existsSync() != true) {
      throw "文件不存在：$iconfontFile";
    }

    String fileContent = iconfontFile.readAsStringSync();
    var iconfontJson = json.decode(fileContent);

    String fontFamily = iconfontJson["font_family"];

    List<String> outDataList = [];
    for (var element in (iconfontJson["glyphs"] as List)) {
      String name = element["name"];
      String font_class = element["font_class"];
      String unicode = element["unicode"];

      font_class = font_class.replaceAll("-", '_').replaceAll(" ", "");
      String data = "  /// $name\n  static const IconData $font_class = IconData(0x$unicode, fontFamily: '$fontFamily');";

      outDataList.add(data);
    }

    String outData = '''
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
/// 该类为自动生成，不需要修改该类

class $className{
${outDataList.join("\n\n").toString()}
}''';

    // 判断目标文件是否存在
    File file = File(targetFile);
    if (await file.exists()) {
      print('目标文件已存在，删除后会重新生成：${file.path}');
      await file.delete();
    }
    await file.create(recursive: true);
    file.writeAsString(outData);
    print('生成成功，生成路径：${file.path}');
  }
}

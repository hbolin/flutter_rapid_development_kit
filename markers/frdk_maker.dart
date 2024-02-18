import 'dart:io';

import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';

/// 将lib/src的都导出到[flutter_rapid_development_kit.dart]文件中
Future<void> main() async {
  String targetFile = "${Directory("lib").path}/flutter_rapid_development_kit.dart";

  List<DirectoryUnderFiles> libs = readDirectoryFiles("lib/src");

  String outData = "library flutter_rapid_development_kit;";

  outData += libs
      .map((e) => e.files
          .map((e2) => '''export 'package:flutter_rapid_development_kit/src/${e2.path.replaceAll("\\", "/").replaceFirst("lib/src/", "")}';''')
          .join("\n"))
      .join("\n\n");

  outData += "\n";

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

import 'dart:io';

import 'package:flutter_rapid_development_kit/maker/base/pubspec_parser.dart';
import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';

/// 生成字体类型的资源
/// [directoryPath] 字体资源路径
/// [targetFile] 存放的文件路径
/// [className] 类名
///
/// ```dart
/// FontAssetMaker.makeFontAssetToFontClass(
///   directoryPath: "assets/fonts",
///   targetFile: 'lib/config/app_font_family_asset.dart',
///   className: 'AppFontFamilyAsset',
/// );
/// ```
class FontAssetMaker {
  /// 打印assets中的images的文件名称
  static Future<void> makeFontAssetToFontClass({
    required String directoryPath,
    required String targetFile,
    required String className,
  }) async {
    // 读取目录
    var directory = Directory(directoryPath);
    if (directory.existsSync() != true) {
      throw "目录不存在：$directoryPath";
    }

    String outData = '''
// ignore_for_file: non_constant_identifier_names
/// 该类为自动生成，不需要修改该类

class $className {
''';

    var temps = directory.listSync();
    for (var element in temps) {
      if (FileSystemEntity.isFileSync(element.path) && !element.path.endsWith(".DS_Store")) {
        outData =
            "$outData  static const ${File(element.path).fileNameWithoutExtension.toLowerCase().replaceAll("-", "_").replaceAll(" ", "_")} = '${File(element.path).fileNameWithoutExtension}';\n";
      }
    }

    outData = "$outData}\n";

    // 判断目标文件是否存在
    File file = File(targetFile);
    if (await file.exists()) {
      print('目标文件已存在，删除后会重新生成：${file.path}');
      await file.delete();
    }
    await file.create(recursive: true);
    file.writeAsString(outData);
    print('生成成功，生成路径：${file.path}');

    PubspecParser.addFontAssetsNode(directoryPath);

    print('处理完成！！！');
  }
}

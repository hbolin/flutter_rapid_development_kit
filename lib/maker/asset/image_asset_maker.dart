import 'dart:io';

import 'package:flutter_rapid_development_kit/maker/base/pubspec_parser.dart';
import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';

/// 生成图片类型的资源
/// [directoryPath] 图片资源路径
/// [targetFile] 存放的文件路径
/// [className] 类名
///
/// ```dart
/// ImageAssetMaker.makeImageAssetToAssetClass(
///   directoryPath: "assets/images",
///   targetFile: 'lib/config/app_image_asset.dart',
///   className: 'AppImageAsset',
/// );
/// ```
class ImageAssetMaker {
  /// 打印assets中的images的文件名称
  static Future<void> makeImageAssetToAssetClass({
    required String directoryPath,
    required String targetFile,
    required String className,
  }) async {
    // 读取目录
    var directory = Directory(directoryPath);
    if (directory.existsSync() != true) {
      throw "目录不存在：$directoryPath";
    }

    String outData = _make(directory, true, className);

    outData = '''
// ignore_for_file: non_constant_identifier_names
/// 该类为自动生成，不需要修改该类

$outData''';

    // 判断目标文件是否存在
    File file = File(targetFile);
    if (await file.exists()) {
      print('目标文件已存在，删除后会重新生成：${file.path}');
      await file.delete();
    }
    await file.create(recursive: true);
    file.writeAsString(outData);
    print('生成成功，生成路径：${file.path}');

    PubspecParser.addFlutterAssetsNode(directoryPath);

    print('处理完成！！！');
  }

  static String _make(Directory directory, bool isRoot, String rootClassName) {
    var temps = directory.listSync();
    var childDirectories = temps.where((element) => FileSystemEntity.isDirectorySync(element.path));
    var childFiles = temps.where((element) => FileSystemEntity.isFileSync(element.path));
    childFiles = childFiles.where((element) => !element.path.endsWith(".DS_Store"));
    var className = '_${directory.directoryName.capitalize()}';
    if (isRoot) {
      className = rootClassName;
    }
    String out = '''
class $className {
  const $className();${() {
      if (childDirectories.isEmpty) return "";
      return "\n${childDirectories.map((element) {
        if (isRoot) {
          return '  static const ${Directory(element.path).directoryName.lowercaseFirstLetter()} = _${Directory(element.path).directoryName.capitalize()}();';
        }
        return '  final ${Directory(element.path).directoryName.lowercaseFirstLetter()} = const _${Directory(element.path).directoryName.capitalize()}();';
      }).join('\n')}";
    }()}${() {
      if (childFiles.isEmpty) return "";
      return "\n${childFiles.map((element) {
        if (isRoot) {
          return '  static const ${File(element.path).fileNameWithoutExtension.toLowerCase().replaceAll("-", "_").replaceAll(" ", "_")} = \'${element.path.replaceAll('\\', '/')}\';';
        }
        return '  final String ${File(element.path).fileNameWithoutExtension.toLowerCase().replaceAll("-", "_").replaceAll(" ", "_")} = \'${element.path.replaceAll('\\', '/')}\';';
      }).join('\n')}";
    }()}
}
''';
    String temp = "";
    for (var element in childDirectories) {
      temp = "$temp\n${_make(Directory(element.path), false, rootClassName)}";
    }
    return out + temp;
  }
}

import 'dart:io';

import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';
import 'package:yaml_edit/yaml_edit.dart';

class PubspecEditor {
  /// 添加image assets节点数据
  static void addImageAssetsNode(String imageAssetsPath, String projectPubspecYamlPath) {
    List<DirectoryUnderFiles> imageAssetsList = readDirectoryFiles(imageAssetsPath);
    imageAssetsList = imageAssetsList.where((element) => element.files.isNotEmpty).toList();

    var yamlEditor = _loadPubspecYamlFile(projectPubspecYamlPath);

    yamlEditor.update([
      'flutter',
      'assets',
    ], imageAssetsList.map((element) => "${element.directory.path}/").toList());

    File(projectPubspecYamlPath).writeAsStringSync(yamlEditor.toString());
  }

  /// 添加font assets节点数据
  static void addFontAssetsNode(String fontAssetsPath, String projectPubspecYamlPath) {
    List<DirectoryUnderFiles> fontAssetsList = readDirectoryFiles(fontAssetsPath);
    fontAssetsList = fontAssetsList.where((element) => element.files.isNotEmpty).toList();

    var yamlEditor = _loadPubspecYamlFile(projectPubspecYamlPath);

    if (fontAssetsList.isEmpty) {
      throw "未配置字体";
    }
    if (fontAssetsList.length > 1) {
      throw "仅支持字体文件放到一个文件夹中，或者分开执行该方法";
    }

    yamlEditor.update(
        ['flutter', 'fonts'],
        fontAssetsList.first.files.map((element) {
          return {
            "family": element.fileNameWithoutExtension,
            "fonts": [
              {
                "asset": element.path,
              }
            ]
          };
        }).toList());

    File(projectPubspecYamlPath).writeAsStringSync(yamlEditor.toString());
  }

  /// 加载pubspec.yaml文件
  static YamlEditor _loadPubspecYamlFile(String pubspecYamlPath) {
    var jsonString = File(pubspecYamlPath).readAsStringSync();

    final yamlEditor = YamlEditor(jsonString);
    return yamlEditor;
  }
}

import 'dart:io';

import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';
import 'package:yaml/yaml.dart';

class PubspecParser {
  /// 添加image assets节点数据
  static void addImageAssetsNode(String assetsPath) {
    List<DirectoryUnderFiles> assetsList = readDirectoryFiles(assetsPath);
    assetsList = assetsList.where((element) => element.files.isNotEmpty).toList();

    String yamlFilePath = "${Directory.current.path}/pubspec.yaml";
    var yamlMap = _parseYamlFile(yamlFilePath);
    var yamLines = _readYamlFile(yamlFilePath);

    // 存在[flutter]->[assets]节点
    if (yamlMap["flutter"] != null && yamlMap["flutter"]["assets"] != null) {
      print("存在[flutter]->[assets]节点");
      var newAssets = assetsList.map((element) => "${element.directory.path.replaceAll("\\", "/")}/").toList();
      var subAssets = newAssets.where((element) => (yamlMap["flutter"]["assets"] as YamlList).contains(element) == false).toList();
      int insertIndex = _calculateNodeLines(yamLines, 1, yamlMap["flutter"], "assets");
      for (int i = 0; i < subAssets.length; i++) {
        var item = subAssets[i];
        yamLines.insert(insertIndex + i + 1, "    - $item");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // 不存在[flutter]节点
    if (yamlMap.containsKey("flutter") == false) {
      print("不存在[flutter]节点");
      int insertIndex = _calculateNodeLines(yamLines, 0, yamlMap, "flutter");
      yamLines.insert(insertIndex, "flutter:");
      yamLines.insert(insertIndex + 1, "  assets:");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        yamLines.insert(insertIndex + i + 2, "    - ${item.directory.path.replaceAll("\\", "/")}/");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // [flutter]节点下没有数据
    if (yamlMap["flutter"] == null) {
      print("[flutter]节点下没有数据");
      int insertIndex = _calculateNodeLines(yamLines, 0, yamlMap, "flutter");
      yamLines.insert(insertIndex + 1, "  assets:");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        yamLines.insert(insertIndex + i + 2, "    - ${item.directory.path.replaceAll("\\", "/")}/");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // [flutter]节点下有数据，但不存在[assets]节点
    if ((yamlMap["flutter"] as YamlMap).containsKey("assets") == false) {
      print("[flutter]节点下有数据，但不存在[assets]节点");
      int insertIndex = _calculateNodeLines(yamLines, 1, yamlMap["flutter"], "assets");
      yamLines.insert(insertIndex, "  assets:");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        yamLines.insert(insertIndex + i + 1, "    - ${item.directory.path.replaceAll("\\", "/")}/");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // [flutter]->[assets]节点下没有数据
    if (yamlMap["flutter"]["assets"] == null) {
      print("[flutter]->[assets]节点下没有数据");
      int insertIndex = _calculateNodeLines(yamLines, 1, yamlMap["flutter"], "assets");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        yamLines.insert(insertIndex + i + 1, "    - ${item.directory.path.replaceAll("\\", "/")}/");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    throw "未判断到的条件，抛出异常";
  }

  /// 向项目中添加image assets节点数据
  static void addImageAssetsNodeOnProject(String projectDirectoryPath, String assetsPath) {
    List<DirectoryUnderFiles> assetsList = readDirectoryFiles("$projectDirectoryPath/$assetsPath");
    assetsList = assetsList.where((element) => element.files.isNotEmpty).toList();

    String yamlFilePath = "$projectDirectoryPath/pubspec.yaml";
    var yamlMap = _parseYamlFile(yamlFilePath);
    var yamLines = _readYamlFile(yamlFilePath);

    // 存在[flutter]->[assets]节点
    if (yamlMap["flutter"] != null && yamlMap["flutter"]["assets"] != null) {
      print("存在[flutter]->[assets]节点");
      var newAssets = assetsList.map((element) {
        String temp = "${element.directory.path.replaceAll("\\", "/")}/";
        temp = temp.substring(projectDirectoryPath.length + 1, temp.length);
        return temp;
      }).toList();
      var subAssets = newAssets.where((element) => (yamlMap["flutter"]["assets"] as YamlList).contains(element) == false).toList();
      int insertIndex = _calculateNodeLines(yamLines, 1, yamlMap["flutter"], "assets");
      for (int i = 0; i < subAssets.length; i++) {
        var item = subAssets[i];
        yamLines.insert(insertIndex + i + 1, "    - $item");
      }

      var assetsYamlList = yamlMap["flutter"]["assets"] as YamlList;
      List<int> removeLines = [];
      for (var value in assetsYamlList.nodes) {
        var temp = "$projectDirectoryPath/${value.value}";
        if (temp.endsWith("/")) {
          temp = temp.substring(0, temp.length - 1);
        }
        if (Directory(temp).existsSync() != true || Directory(temp).listSync().isEmpty) {
          removeLines.add(value.span.start.line);
        }
      }
      if (removeLines.isNotEmpty) {
        print("节点有不存在的资源，需要移除：$removeLines");
      }
      List<String> outYamLines = [];
      for (int i = 0; i < yamLines.length; i++) {
        var itemData = yamLines[i];
        if (removeLines.contains(i) != true) {
          outYamLines.add(itemData);
        }
      }

      File(yamlFilePath).writeAsStringSync(outYamLines.join("\n"));
      return;
    }

    throw "未判断到的条件，抛出异常";
  }

  /// 添加font assets节点数据
  static void addFontAssetsNode(String assetsPath) {
    List<FileSystemEntity> assetsList = Directory(assetsPath).listSync();

    String yamlFilePath = "${Directory.current.path}/pubspec.yaml";
    var yamlMap = _parseYamlFile(yamlFilePath);
    var yamLines = _readYamlFile(yamlFilePath);

    // 存在[flutter]->[fonts]节点
    if (yamlMap["flutter"] != null && yamlMap["flutter"]["fonts"] != null) {
      print("存在[flutter]->[fonts]节点");
      var subAssets = assetsList.where((element) {
        var fileName = File(element.path).fileNameWithoutExtension;
        return (yamlMap["flutter"]["fonts"] as YamlList).map((element2) => element2["family"]).contains(fileName) == false;
      }).toList();
      int insertIndex = _calculateNodeLines(yamLines, 1, yamlMap["flutter"], "fonts");
      for (int i = 0; i < subAssets.length; i++) {
        var item = subAssets[i];
        insertIndex += 1;
        yamLines.insert(insertIndex, "    - family: ${File(item.path).fileNameWithoutExtension}");
        insertIndex += 1;
        yamLines.insert(insertIndex, "      fonts: ");
        insertIndex += 1;
        yamLines.insert(insertIndex, "        - asset: ${item.path}");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // 不存在[flutter]节点
    if (yamlMap.containsKey("flutter") == false) {
      print("不存在[flutter]节点");
      int insertIndex = _calculateNodeLines(yamLines, 0, yamlMap, "flutter");
      yamLines.insert(insertIndex, "flutter:");
      insertIndex += 1;
      yamLines.insert(insertIndex, "  fonts:");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        insertIndex += 1;
        yamLines.insert(insertIndex, "    - family: ${File(item.path).fileNameWithoutExtension}");
        insertIndex += 1;
        yamLines.insert(insertIndex, "      fonts: ");
        insertIndex += 1;
        yamLines.insert(insertIndex, "        - asset: ${item.path}");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // [flutter]节点下没有数据
    if (yamlMap["flutter"] == null) {
      print("[flutter]节点下没有数据");
      int insertIndex = _calculateNodeLines(yamLines, 0, yamlMap, "flutter");
      insertIndex += 1;
      yamLines.insert(insertIndex, "  fonts:");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        insertIndex += 1;
        yamLines.insert(insertIndex, "    - family: ${File(item.path).fileNameWithoutExtension}");
        insertIndex += 1;
        yamLines.insert(insertIndex, "      fonts: ");
        insertIndex += 1;
        yamLines.insert(insertIndex, "        - asset: ${item.path}");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // [flutter]节点下有数据，但不存在[fonts]节点
    if ((yamlMap["flutter"] as YamlMap).containsKey("fonts") == false) {
      print("[flutter]节点下有数据，但不存在[fonts]节点");
      int insertIndex = _calculateNodeLines(yamLines, 1, yamlMap["flutter"], "fonts");
      yamLines.insert(insertIndex, "  fonts:");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        insertIndex += 1;
        yamLines.insert(insertIndex, "    - family: ${File(item.path).fileNameWithoutExtension}");
        insertIndex += 1;
        yamLines.insert(insertIndex, "      fonts: ");
        insertIndex += 1;
        yamLines.insert(insertIndex, "        - asset: ${item.path}");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    // [flutter]->[fonts]节点下没有数据
    if (yamlMap["flutter"]["fonts"] == null) {
      print("[flutter]->[fonts]节点下没有数据");
      int insertIndex = _calculateNodeLines(yamLines, 1, yamlMap["flutter"], "fonts");
      for (int i = 0; i < assetsList.length; i++) {
        var item = assetsList[i];
        insertIndex += 1;
        yamLines.insert(insertIndex, "    - family: ${File(item.path).fileNameWithoutExtension}");
        insertIndex += 1;
        yamLines.insert(insertIndex, "      fonts: ");
        insertIndex += 1;
        yamLines.insert(insertIndex, "        - asset: ${item.path}");
      }
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
      return;
    }

    throw "未判断到的条件，抛出异常";
  }

  /// 拷贝yaml依赖
  static void copyYamlPlugins(String sourceYamlPath, String targetYamlPath) {
    var sourceYamlMap = _parseYamlFile(sourceYamlPath);
    var sourceYamLines = _readYamlFile(sourceYamlPath);

    var targetYamlMap = _parseYamlFile(targetYamlPath);
    var targetYamLines = _readYamlFile(targetYamlPath);

    var sourceLines =
        sourceYamLines.sublist((sourceYamlMap["dependencies"] as YamlMap).span.start.line, (sourceYamlMap["dependencies"] as YamlMap).span.end.line);
    // print(sourceLines.join("\n"));

    targetYamLines.removeRange((targetYamlMap["dependencies"] as YamlMap).span.start.line, (targetYamlMap["dependencies"] as YamlMap).span.end.line);
    targetYamLines.insertAll((targetYamlMap["dependencies"] as YamlMap).span.start.line, sourceLines);
    // print(targetYamLines.join("\n"));
    File(targetYamlPath).writeAsStringSync(targetYamLines.join("\n"));
  }

  /// 添加插件
  static void addPlugin(String pluginNode) {
    String yamlFilePath = "${Directory.current.path}/pubspec.yaml";
    var yamlMap = _parseYamlFile(yamlFilePath);
    var yamLines = _readYamlFile(yamlFilePath);
    // print(yamlMap["dependencies"]);
    if ((yamlMap["dependencies"] as YamlMap).containsKey(pluginNode.split(":").first.trim()) == false) {
      int insertIndex = _calculateNodeLines(yamLines, 0, yamlMap, "dependencies");
      yamLines.insert(insertIndex, "  $pluginNode\n");
      // print(yamLines.join("\n"));
      File(yamlFilePath).writeAsStringSync(yamLines.join("\n"));
    }
  }

  static YamlMap _parseYamlFile(String yamFilePath) {
    var yamFile = File(yamFilePath);
    var fileContent = yamFile.readAsStringSync();
    var doc = loadYaml(fileContent);
    return doc as YamlMap;
  }

  static List<String> _readYamlFile(String yamlFilePath) {
    var yamFile = File(yamlFilePath);
    return yamFile.readAsLinesSync();
  }

  /// 计算往节点添加的行数
  static int _calculateNodeLines(List<String> yamLines, int currentNodeLevel, YamlMap currentYamlNode, String findNodeName) {
    // print(currentYamlNode);
    if (currentYamlNode[findNodeName] != null) {
      // 找到了节点
      return currentYamlNode[findNodeName].span.end.line;
    } else if (currentYamlNode.containsKey(findNodeName) == true) {
      // 只找到节点的名字
      String tempNodeName = findNodeName.trim();
      for (int i = 0; i < currentNodeLevel; i++) {
        tempNodeName = "  $findNodeName";
      }
      tempNodeName = "$tempNodeName:";
      for (int i = 0; i < yamLines.length; i++) {
        var line = yamLines[i];
        if (line.trimRight() == tempNodeName) {
          return i;
        }
      }
      throw "未找到只有节点名字的行数";
    } else {
      return yamLines.length;
    }
  }
}

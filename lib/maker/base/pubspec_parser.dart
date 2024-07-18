import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';
import 'package:yaml/yaml.dart';

class PubspecParser {
  /// 添加通用资源到yaml配置文件中，一般都是图片资源
  static void addCommonAssetsNode(String assetDirectoryPath) {
    var directory = Directory(assetDirectoryPath);
    var resultList = readDirectoryFiles(directory.path);
    var assetDirectories = resultList.map((e) {
      var temp = e.directory.path.replaceAll("\\", "/");
      if (!temp.endsWith("/")) {
        temp += "/";
      }
      return temp;
    }).toList();

    var pubspecYamlFilePath = "${Directory.current.path}/pubspec.yaml";
    var pubspecYamlFile = File(pubspecYamlFilePath);
    var pubspecContent = pubspecYamlFile.readAsStringSync();
    var pubspecContentLines = pubspecYamlFile.readAsLinesSync();

    var doc = loadYaml(pubspecContent);

    final Map<dynamic, dynamic> yamlMap = doc as YamlMap;

    if (yamlMap["flutter"]["assets"] == null) {
      print("未配置assets节点");

      // 未配置flutter节点
      var flutterNodeIndex = pubspecContentLines.indexWhere((element) => element.startsWith("flutter:"));

      pubspecContentLines.insert(flutterNodeIndex + 1, "  assets:");
      assetDirectories.forEachIndexed((index, element) {
        pubspecContentLines.insert(flutterNodeIndex + 2 + index, "    - $element");
      });
      print("需要配置加入节点数据:$assetDirectories");

      // 配置assets后，如果下一行没有空行，就空行下
      if (pubspecContentLines[flutterNodeIndex + 1 + assetDirectories.length + 1].trim().isNotEmpty) {
        pubspecContentLines.insert(flutterNodeIndex + 1 + assetDirectories.length + 1, "");
      }
    } else {
      print("已配置assets节点");
      var assets = yamlMap["flutter"]["assets"] as YamlList;
      var assetsTemp = assets.nodes.map((e) => e.value.toString()).toList();

      assetDirectories.removeWhere((element1) => assetsTemp.firstWhereOrNull((element2) => element2 == element1) != null);
      print("需要配置加入节点数据:$assetDirectories");

      var flutterNodeIndex = pubspecContentLines.indexWhere((element) => element.startsWith("flutter:"));
      assetDirectories.forEachIndexed((index, element) {
        pubspecContentLines.insert(flutterNodeIndex + 1 + assetsTemp.length + index, "    - $element");
      });
    }

    pubspecYamlFile.writeAsStringSync("${pubspecContentLines.join("\n")}\n");

    print("已经往pubspec.yaml加入了对应的节点！！！");
  }

  /// 添加字体资源到yaml配置文件中
  static void addFontAssetsNode(String assetDirectoryPath) {
    var directory = Directory(assetDirectoryPath);
    var fontFiles = directory.listSync().where((element) => FileSystemEntity.isFileSync(element.path)).toList();
    if (fontFiles.isEmpty) {
      print("没有字体文件，不进行加入节点！！！");
      return;
    }

    var pubspecYamlFilePath = "${Directory.current.path}/pubspec.yaml";
    var pubspecYamlFile = File(pubspecYamlFilePath);
    var pubspecContent = pubspecYamlFile.readAsStringSync();
    var pubspecContentLines = pubspecYamlFile.readAsLinesSync();

    var doc = loadYaml(pubspecContent);

    final Map<dynamic, dynamic> yamlMap = doc as YamlMap;

    bool isConfigAssetsNode = yamlMap["flutter"]["assets"] != null;
    print("是否配置了assets节点：$isConfigAssetsNode");
    List<String> assetsTemp = [];
    if (isConfigAssetsNode) {
      var assets = yamlMap["flutter"]["assets"] as YamlList;
      assetsTemp = assets.nodes.map((e) => e.value.toString()).toList();
    }

    if (yamlMap["flutter"].keys.contains("fonts") != true) {
      print("未配置fonts节点");

      var assetsNodeIndex = pubspecContentLines.indexWhere((element) => element.startsWith("  assets:"));
      if (assetsNodeIndex < 0) {
        assetsNodeIndex = pubspecContentLines.indexWhere((element) => element.startsWith("flutter:"));
      }

      var nextLine = assetsNodeIndex + assetsTemp.length;
      nextLine += 1;
      pubspecContentLines.insert(nextLine, "");

      nextLine += 1;
      pubspecContentLines.insert(nextLine, "  fonts:");

      fontFiles.forEachIndexed((index, element) {
        nextLine = nextLine + 1 + index * 0;
        pubspecContentLines.insert(nextLine, "    - family: ${File(element.path).fileNameWithoutExtension}");
        nextLine += 1;
        pubspecContentLines.insert(nextLine, "      fonts:");
        nextLine += 1;
        pubspecContentLines.insert(nextLine, "      - asset: ${File(element.path).path.replaceAll("\\", "/")}");
      });

      // 配置assets后，如果下一行没有空行，就空行下
      nextLine += 1;
      if (pubspecContentLines[nextLine].trim().isNotEmpty) {
        pubspecContentLines.insert(nextLine, "");
      }
    } else {
      print("已配置fonts节点");

      int nodeLinesCount = 0;
      if (yamlMap["flutter"]["fonts"] != null) {
        var assets = yamlMap["flutter"]["fonts"] as YamlList;
        var assetsTemp = assets.map((element) => element["family"]);
        fontFiles.removeWhere((element1) => assetsTemp.firstWhereOrNull((element2) => element2 == File(element1.path).fileNameWithoutExtension) != null);
        nodeLinesCount = _calculateNodeLines(pubspecContentLines, assets);
      }

      fontFiles.sorted((a, b) => File(a.path).fileNameWithoutExtension.compareTo(File(b.path).fileNameWithoutExtension));
      print("需要配置加入节点数据:${fontFiles.join("；")}");

      var assetsNodeIndex = pubspecContentLines.indexWhere((element) => element.startsWith("  fonts:"));

      var nextLine = assetsNodeIndex + nodeLinesCount;
      fontFiles.forEachIndexed((index, element) {
        nextLine = nextLine + 1 + index * 0;
        pubspecContentLines.insert(nextLine, "    - family: ${File(element.path).fileNameWithoutExtension}");
        nextLine += 1;
        pubspecContentLines.insert(nextLine, "      fonts:");
        nextLine += 1;
        pubspecContentLines.insert(nextLine, "      - asset: ${File(element.path).path.replaceAll("\\", "/")}");
      });

      // 配置assets后，如果下一行没有空行，就空行下
      nextLine += 1;
      if (pubspecContentLines[nextLine].trim().isNotEmpty) {
        pubspecContentLines.insert(nextLine, "");
      }
    }

    pubspecYamlFile.writeAsStringSync("${pubspecContentLines.join("\n")}\n");

    print("已经往pubspec.yaml加入了对应的节点！！！");
  }

  static int _calculateNodeLines(List<String> pubspecContentLines, YamlNode node) {
    int nodeStartIndex = node.span.start.line - 1;
    int nodeEndIndex = node.span.end.line - 1;
    for (int i = nodeEndIndex; i > -1; i--) {
      var temp = pubspecContentLines[i].trim();
      if (temp.isNotEmpty && !temp.startsWith("#")) {
        nodeEndIndex = i;
        break;
      }
    }
    return nodeEndIndex - nodeStartIndex;
  }
}

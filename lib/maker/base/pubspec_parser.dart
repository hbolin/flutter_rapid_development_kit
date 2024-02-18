import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';
import 'package:yaml/yaml.dart';

class PubspecParser {
  static void addFlutterAssetsNode(String assetDirectoryPath) {
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

    if (yamlMap["flutter"]["fonts"] == null) {
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
      var assets = yamlMap["flutter"]["fonts"] as YamlList;

      NodeLines nodeLines = NodeLines();
      calculateNodeLines(assets, nodeLines);
      print(nodeLines.count);

      var assetsTemp = assets.map((element) => element["family"]);

      fontFiles.removeWhere((element1) => assetsTemp.firstWhereOrNull((element2) => element2 == File(element1.path).fileNameWithoutExtension) != null);
      print("需要配置加入节点数据:$fontFiles");

      var assetsNodeIndex = pubspecContentLines.indexWhere((element) => element.startsWith("  fonts:"));

      var nextLine = assetsNodeIndex + nodeLines.count;
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

  static void calculateNodeLines(YamlNode node, NodeLines nodeLines) {
    // print("${node.runtimeType} $node");
    if (node is YamlMap) {
      node.forEach((key, value) {
        nodeLines.count += 1;
        // print("${value.runtimeType} $value");
        if (value is YamlMap || value is YamlList) {
          calculateNodeLines(value, nodeLines);
        }
      });
    } else if (node is YamlList) {
      for (var element in node) {
        calculateNodeLines(element, nodeLines);
      }
    }
  }
}

class NodeLines {
  int count = 0;
}

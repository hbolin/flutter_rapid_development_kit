import 'dart:io';

import 'package:collection/collection.dart';
import 'package:path/path.dart' as path;

/// 递归读取[directoryPath]目录下的所有文件
List<DirectoryUnderFiles> readDirectoryFiles(String directoryPath) {
  List<DirectoryUnderFiles> result = [];
  _readDirectoryFiles(directoryPath, result);
  return result;
}

void _readDirectoryFiles(String directoryPath, List<DirectoryUnderFiles> result) {
  var directory = Directory(directoryPath);
  if (directory.existsSync() != true) {
    throw "目录不存在：$directoryPath";
  }
  var temps = directory.listSync();

  var directoryListTemp = temps.where((element) => FileSystemEntity.isDirectorySync(element.path));
  // var fileListTemp = temps.where((element) => FileSystemEntity.isFileSync(element.path));
  var fileListTemp = temps.where((element) => FileSystemEntity.isFileSync(element.path) && !element.path.endsWith(".DS_Store"));

  var directories = directoryListTemp.map((e) => Directory(e.path)).sorted((a, b) => a.directoryName.compareTo(b.directoryName));
  var files = fileListTemp.map((e) => File(e.path)).sorted((a, b) => a.fileNameWithoutExtension.compareTo(b.fileNameWithoutExtension));

  result.add(DirectoryUnderFiles(directory, files));

  for (var element in directories) {
    _readDirectoryFiles(element.path, result);
  }
}

/// 目录下的文件
class DirectoryUnderFiles {
  /// 目录
  final Directory directory;

  /// 文件集合
  final List<File> files;

  DirectoryUnderFiles(this.directory, this.files);

  @override
  String toString() {
    return '目录:  \n${directory.path}\n文件:\n${files.map((e) => e.path).join("\n")}';
  }
}

// ---------------------------------------------------- extension ----------------------------------------------------

extension FrdkDirectoryExtension on Directory {
  /// 目录名
  String get directoryName {
    return path.basenameWithoutExtension(this.path);
  }
}

extension FrdkFileExtension on File {
  /// 文件名，不包括后缀
  String get fileNameWithoutExtension {
    return path.basenameWithoutExtension(this.path);
  }

  /// 文件名
  String get fileName {
    return path.basename(this.path);
  }
}

extension FrdkStringExtension on String {
  /// 首字母大写
  String toUpperCaseFirstLetter() {
    if (isEmpty) {
      return this;
    }
    var charList = toCharList();
    return "${charList.first.toUpperCase()}${charList.sublist(1, charList.length).join()}";
  }

  /// 首字母小写
  String toLowerCaseFirstLetter() {
    if (isEmpty) {
      return this;
    }
    var charList = toCharList();
    return "${charList.first.toLowerCase()}${charList.sublist(1, charList.length).join()}";
  }

  /// 将字符串拆分为单个字符组成的列表
  List<String> toCharList() {
    return runes.map((e) => String.fromCharCode(e)).toList();
  }
}

// void main() {
//   // var path = Directory.current.path;
//   // print("查找的目录：$path");
//   // print("---------------------------------------------------");
//   // var resultList = readDirectoryFiles(Directory.current.path);
//   // print(resultList.map((e) => "$e").join("\n------------------------------------------------------------------------------------------------------\n"));
//
//   // var path = "/Users/zhangwu/development/my_flutter_foundation/flutter_rapid_development_kit_frdk-v3.0.0/lib/src/widget/visibility_builder.dart";
//   // var file = File(path);
//   // print(file.fileNameWithoutExtension);
//   // print(file.fileName);
//
//   // var dirPath = "/Users/zhangwu/development/my_flutter_foundation/flutter_rapid_development_kit_frdk-v3.0.0/lib/src/widget";
//   // var dir = Directory(dirPath);
//   // print(dir.directoryName);
//   // print(dir.directoryName.toUpperCaseFirstLetter());
//   // print(dir.directoryName.toUpperCase());
//   // print(dir.directoryName.toUpperCase().toLowerCaseFirstLetter());
//   // print(dir.directoryName.toUpperCase().toLowerCaseFirstLetter().toUpperCaseFirstLetter());
//
//   // var path = "/Users/zhangwu/development/my_flutter_foundation/flutter_rapid_development_kit_frdk-v3.0.0";
//   // print("查找的目录：$path");
//   // print("---------------------------------------------------");
//   // var resultList = readDirectoryFiles(path);
//   // print(resultList.map((e) => "$e").join("\n------------------------------------------------------------------------------------------------------\n"));
// }

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
  var fileListTemp = temps.where((element) => FileSystemEntity.isFileSync(element.path));

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

extension DirectoryExtension on Directory {
  /// 目录名
  String get directoryName {
    return path.basenameWithoutExtension(this.path);
  }
}

extension FileExtension on File {
  /// 文件名，不包括后缀
  String get fileNameWithoutExtension {
    return path.basenameWithoutExtension(this.path);
  }

  /// 文件名
  String get fileName {
    return path.basename(this.path);
  }
}

extension StringExtension on String {
  /// 首字母大写
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// 首字母小写
  String lowercaseFirstLetter() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }
}

void main() {
  var path = Directory.current.path;
  print("查找的目录：$path");
  print("---------------------------------------------------");
  var resultList = readDirectoryFiles(Directory.current.path);
  print(resultList.map((e) => "$e").join("\n------------------------------------------------------------------------------------------------------\n"));
}

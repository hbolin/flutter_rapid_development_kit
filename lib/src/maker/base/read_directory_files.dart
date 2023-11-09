import 'dart:io';
import 'package:path/path.dart' as path;

/// 读取[directoryPath]目录下的文件，并输出到[result]中
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
  List<File> files = [];
  for (var element in temps) {
    var isDirectory = FileSystemEntity.isDirectorySync(element.path);
    if (isDirectory) {
      _readDirectoryFiles(element.path, result);
    } else {
      var isFile = FileSystemEntity.isFileSync(element.path);
      if (isFile) {
        files.add(File(element.path));
      } else {
        throw '未知文件：${element.path}';
      }
    }
  }
  result.add(DirectoryUnderFiles(directory, files));
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
    return 'DirectoryUnderFiles{directory: $directory, files: $files}';
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

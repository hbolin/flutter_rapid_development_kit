import 'dart:io';

// main() {
//   print(Directory(Directory.current.path));
//   deleteDsStoreFile(Directory(Directory.current.path));
// }

void deleteDsStoreFile(Directory directory) {
  for (var value in directory.listSync()) {
    if (FileSystemEntity.isDirectorySync(value.path)) {
      deleteDsStoreFile(Directory(value.path));
    } else if (FileSystemEntity.isFileSync(value.path) && value.path.endsWith(".DS_Store")) {
      File(value.path).deleteSync();
      print("以下文件已删除：${value.path}");
    }
  }
}

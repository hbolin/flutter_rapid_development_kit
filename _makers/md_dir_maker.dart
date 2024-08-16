import 'package:collection/collection.dart';
import 'package:flutter_rapid_development_kit/maker/base/read_directory_files.dart';

void main() {
  List<DirectoryUnderFiles> libs = readDirectoryFiles("lib/src");
  libs.removeWhere((element) => element.directory.directoryName == "src");

  String outData = "```\n";
  outData += "src\n";
  outData += "│\n";

  outData += libs.mapIndexed((index, e) {
    return "└───${e.directory.directoryName}\n${e.files.map((e2) => "${index == libs.length - 1 ? " " : "│"}        ${e2.fileName}\n").join("")}";
  }).join("│   \n");

  outData += "```";

  print(outData);
}

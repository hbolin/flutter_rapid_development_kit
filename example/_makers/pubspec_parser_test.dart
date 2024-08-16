import 'package:flutter_rapid_development_kit/flutter_rapid_development_maker.dart';

main() {
  // String assetsPath = "assets/images";
  // PubspecParser.addImageAssetsNode(assetsPath);
  // PubspecParser.addPlugin("tutorial_coach_mark: ^1.2.12");
  PubspecParser.copyYamlPlugins("/Users/zhangwu/development/workspace/flutter/dy-app-v2/pubspec.yaml", "pubspec.yaml");
}

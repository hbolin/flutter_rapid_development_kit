import 'dart:io';

import 'package:flutter_rapid_development_maker/flutter_rapid_development_maker.dart';

void main() {
  ImageAssetMaker.makeImageAssetToAssetClass(
    directoryPath: "assets/images",
    targetFile: 'lib/config/app_image_asset.dart',
    className: 'AppImageAsset',
  );
  // PubspecEditor.updateImageAssetsNode("assets/images", "${Directory.current.path}/pubspec.yaml");
}

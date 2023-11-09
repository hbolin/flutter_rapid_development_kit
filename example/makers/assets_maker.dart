import 'package:flutter_rapid_development_kit/flutter_rapid_development_maker.dart';

main() {
  ImageAssetMaker.makeImageAssetToAssetClass(
    directoryPath: "assets/images",
    targetFile: 'lib/config/app_image_asset.dart',
    className: 'AppImageAsset',
  );
}

import 'package:flutter_rapid_development_kit/org.phoenix.commons/maker/asset/image_asset_maker.dart';

main() {
  ImageAssetMaker.makeImageAssetToAssetClass(
    directoryPath: "assets",
    targetFile: 'lib/config/app_image_asset.dart',
    className: 'AppImageAsset',
  );
}

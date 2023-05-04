import 'package:flutter_rapid_development_kit/org.phoenix.commons/maker/asset/font_asset_maker.dart';

main() {
  FontAssetMaker.makeFontAssetToFontClass(
    directoryPath: "assets/fonts",
    targetFile: 'lib/config/font_family_asset.dart',
    className: 'FontFamilyAsset',
  );
}

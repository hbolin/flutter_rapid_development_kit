import 'package:flutter_rapid_development_kit/flutter_rapid_development_maker.dart';

main() {
  FontAssetMaker.makeFontAssetToFontClass(
    directoryPath: "assets/fonts",
    targetFile: 'lib/config/font_family_asset.dart',
    className: 'FontFamilyAsset',
  );
}

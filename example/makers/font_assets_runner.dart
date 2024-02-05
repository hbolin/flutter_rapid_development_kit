import 'package:flutter_rapid_development_kit/flutter_rapid_development_maker.dart';

void main() {
  FontAssetMaker.makeFontAssetToFontClass(
    directoryPath: "assets/fonts",
    targetFile: 'lib/config/app_font_family_asset.dart',
    className: 'AppFontFamilyAsset',
  );
}

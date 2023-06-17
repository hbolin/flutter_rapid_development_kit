import 'dart:io';

import 'package:xml/xml.dart';
import 'package:path/path.dart' as path;

/// [directoryPath] 图片资源路径
/// [targetFile] 存放的文件路径
class ThemeMaker {
  static void makerThemeFiles({
    required String directoryPath,
    required String targetFile,
  }) {
    Directory colorDirectory = Directory("$directoryPath/color");
    Directory sizeDirectory = Directory("$directoryPath/size");
    Directory textDirectory = Directory("$directoryPath/text");

    // 找到color子文件
    List<FileSystemEntity> colorChildren = colorDirectory.listSync();
    colorChildren = colorChildren.where((element) => FileSystemEntity.isFileSync(element.path)).toList();

    // 找到size子文件
    List<FileSystemEntity> sizeChildren = sizeDirectory.listSync();
    sizeChildren = sizeChildren.where((element) => FileSystemEntity.isFileSync(element.path)).toList();

    // 找到text子文件
    List<FileSystemEntity> textChildren = textDirectory.listSync();
    textChildren = textChildren.where((element) => FileSystemEntity.isFileSync(element.path)).toList();

    makeAppThemeType(colorChildren, targetFile);

    makeAppColorStyle(colorChildren, targetFile);

    makeAppSizeStyle(sizeChildren, targetFile);

    makeAppTextStyle(textChildren, targetFile);

    makeAppTheme(targetFile);

    makAppThemeManager(targetFile);
  }

  /// 生成AppThemeType文件
  static void makeAppThemeType(List<FileSystemEntity> children, String targetFile) {
    String appThemeTypePath = "$targetFile/theme_type.dart";

    List<String> enumThemes = _enumTheme(children);

    String outData = '''
/// 该文件为自动生成，手动更改该文件，修改的内容，会被替换。
/// app 主题类型
enum AppThemeType {
${enumThemes.map((element) => "  $element,").toList().join("\n")}
}''';

    _makeFile(appThemeTypePath, outData);
  }

  /// 生成AppColorStyle文件
  static void makeAppColorStyle(List<FileSystemEntity> children, String targetFile) {
    String appColorStylePath = "$targetFile/src/color_style.dart";

    List<String> enumThemes = _enumTheme(children);

    List<Map<String, String>> colorMapsList = children.map((e) => _findColor(File(e.path))).toList();

    Map<String, String> firstColorMaps = colorMapsList.first;

    String outData = '''
import 'package:flutter/material.dart';

import '../theme_type.dart';

/// 该文件为自动生成，手动更改该文件，修改的内容，会被替换。
/// 颜色配置
abstract class AppColorStyle {
  factory AppColorStyle(AppThemeType type) {
    switch (type) {
${enumThemes.map((e) => "      case AppThemeType.$e:\n        return const ${e.capitalize()}AppColorStyle();").toList().join("\n")}
    }
  }
  
${firstColorMaps.keys.map((key) => "  Color get $key;").toList().join("\n\n")}
}

${() {
      String temp = "";
      for (int i = 0; i < enumThemes.length; i++) {
        String enumTheme = enumThemes[i];
        Map<String, String> colorMaps = colorMapsList[i];
        temp += '''
class ${enumTheme.capitalize()}AppColorStyle implements AppColorStyle {
  const ${enumTheme.capitalize()}AppColorStyle();
 
${colorMaps.keys.map((key) => '''
  @override
  Color get $key => const Color(${colorMaps[key]!.length == 6 ? "0xff${colorMaps[key]}" : "0x${colorMaps[key]}"});''').toList().join("\n\n")} 
}
''';
        if (i != (enumThemes.length - 1)) {
          temp += "\n";
        }
      }
      return temp;
    }()}
''';

    _makeFile(appColorStylePath, outData);
  }

  /// 生成AppSizeStyle文件
  static void makeAppSizeStyle(List<FileSystemEntity> children, String targetFile) {
    String appSizeStylePath = "$targetFile/src/size_style.dart";

    List<String> enumThemes = _enumTheme(children);

    List<Map<String, String>> colorMapsList = children.map((e) => _findSize(File(e.path))).toList();

    Map<String, String> firstColorMaps = colorMapsList.first;

    String outData = '''
import 'package:flutter/material.dart';

import '../theme_type.dart';

/// 该文件为自动生成，手动更改该文件，修改的内容，会被替换。
/// 大小配置
abstract class AppSizeStyle {
  factory AppSizeStyle(AppThemeType type) {
    switch (type) {
${enumThemes.map((e) => "      case AppThemeType.$e:\n        return const ${e.capitalize()}AppSizeStyle();").toList().join("\n")}
    }
  }
  
${firstColorMaps.keys.map((key) => "  double get $key;").toList().join("\n\n")}
}

${() {
      String temp = "";
      for (int i = 0; i < enumThemes.length; i++) {
        String enumTheme = enumThemes[i];
        Map<String, String> colorMaps = colorMapsList[i];
        temp += '''
class ${enumTheme.capitalize()}AppSizeStyle implements AppSizeStyle {
  const ${enumTheme.capitalize()}AppSizeStyle();
 
${colorMaps.keys.map((key) => '''
  @override
  double get $key => ${colorMaps[key]};''').toList().join("\n\n")} 
}
''';
        if (i != (enumThemes.length - 1)) {
          temp += "\n";
        }
      }
      return temp;
    }()}
''';

    _makeFile(appSizeStylePath, outData);
  }

  /// 生成AppTextStyle文件
  static void makeAppTextStyle(List<FileSystemEntity> children, String targetFile) {
    String appTextStylePath = "$targetFile/src/text_style.dart";

    List<String> enumThemes = _enumTheme(children);

    List<Map<String, _Text>> colorMapsList = children.map((e) => _findText(File(e.path))).toList();

    Map<String, _Text> firstColorMaps = colorMapsList.first;

    String outData = '''
import 'package:flutter/material.dart';

import '../theme_type.dart';
import 'color_style.dart';
import 'size_style.dart';

/// 字体粗细
class FontWeightType {
  final FontWeight fontWeight;

  /// light 细体
  const FontWeightType.light() : fontWeight = FontWeight.w300;

  /// regular 常规
  const FontWeightType.regular() : fontWeight = FontWeight.w400;

  /// medium 中等
  const FontWeightType.medium() : fontWeight = FontWeight.w500;

  /// semibold 半粗
  const FontWeightType.semibold() : fontWeight = FontWeight.w600;
}

/// 该文件为自动生成，手动更改该文件，修改的内容，会被替换。
/// 字体样式
abstract class AppTextStyle {
  factory AppTextStyle(AppThemeType type) {
    switch (type) {
${enumThemes.map((e) => "      case AppThemeType.$e:\n        return ${e.capitalize()}AppTextStyle(type);").toList().join("\n")}
    }
  }
  
${firstColorMaps.keys.map((key) => "  TextStyle $key({Color? color, FontWeightType? fontWeightType});").toList().join("\n\n")}
}

${() {
      String temp = "";
      for (int i = 0; i < enumThemes.length; i++) {
        String enumTheme = enumThemes[i];
        Map<String, _Text> colorMaps = colorMapsList[i];
        temp += '''
class ${enumTheme.capitalize()}AppTextStyle implements AppTextStyle {
  final AppThemeType appThemeType;

  const ${enumTheme.capitalize()}AppTextStyle(this.appThemeType);
 
${colorMaps.keys.map((key) => '''
  @override
  TextStyle $key({Color? color, FontWeightType? fontWeightType}){
    return TextStyle(
      fontSize: AppSizeStyle(appThemeType).${colorMaps[key]!.size},
      color: color ?? AppColorStyle(appThemeType).${colorMaps[key]!.color},
      fontWeight: fontWeightType?.fontWeight ?? const FontWeightType.regular().fontWeight,
    );
  }''').toList().join("\n\n")} 
}
''';
        if (i != (enumThemes.length - 1)) {
          temp += "\n";
        }
      }
      return temp;
    }()}
''';

    _makeFile(appTextStylePath, outData);
  }

  /// 生成AppTheme文件
  static void makeAppTheme(String targetFile) {
    String appThemePath = "$targetFile/src/style.dart";

    File file = File(appThemePath);
    if (file.existsSync()) {
      return;
    }

    String outData = '''
import 'package:flutter/material.dart';

import '../theme_type.dart';
import 'color_style.dart';
import 'size_style.dart';
import 'text_style.dart';

/// App主题配置
class AppTheme {
  AppTheme._();

  /// 获取主题，默认是亮色
  static ThemeData getTheme(AppThemeType type) {
    switch (type) {
      case AppThemeType.dark:
        return _darkTheme;
      case AppThemeType.light:
        return _lightTheme;
      case AppThemeType.lightBig:
        return _lightBigTheme;
    }
  }

  // TODO:暗黑模式，暂未配置有效的颜色值
  static final ThemeData _darkTheme = _getBaseTheme(AppThemeType.dark).copyWith(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColorStyle(AppThemeType.dark).scaffoldBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: AppColorStyle(AppThemeType.dark).textBodyColor,
        fontSize: AppSizeStyle(AppThemeType.dark).textBigTitle,
        fontWeight: const FontWeightType.medium().fontWeight,
      ),
    ),
  );

  static final ThemeData _lightTheme = _getBaseTheme(AppThemeType.light);

  static final ThemeData _lightBigTheme = _getBaseTheme(AppThemeType.lightBig);

  static ThemeData _getBaseTheme(AppThemeType type) {
    AppColorStyle colorStyle = AppColorStyle(type);
    AppSizeStyle sizeStyle = AppSizeStyle(type);
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colorStyle.primaryColor,
      scaffoldBackgroundColor: colorStyle.scaffoldBackgroundColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: colorStyle.primaryColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: colorStyle.textFieldHintTextColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: colorStyle.textBodyColor,
          fontSize: sizeStyle.textBigTitle,
          fontWeight: const FontWeightType.medium().fontWeight,
        ),
      ),
      unselectedWidgetColor: colorStyle.iconHitColor,
    );
  }
}''';

    _makeFile(appThemePath, outData);
  }

  /// 生成AppThemeManager文件
  static void makAppThemeManager(String targetFile) {
    String appThemeManagerPath = "$targetFile/theme_manager.dart";

    File file = File(appThemeManagerPath);
    if (file.existsSync()) {
      return;
    }
    String outData = '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/color_style.dart';
import 'src/size_style.dart';
import 'src/style.dart';
import 'src/text_style.dart';
import 'theme_type.dart';

/// 主题管理器
class AppThemeManager {
  AppThemeManager._();

  /// 当前主题
  static late AppThemeType currentAppThemeType;

  /// 初始化主题
  static ThemeData init([AppThemeType type = AppThemeType.light]) {
    currentAppThemeType = type;
    return AppTheme.getTheme(type);
  }

  /// 改变主题
  static void changeTheme(AppThemeType type) {
    currentAppThemeType = type;
    Get.changeTheme(AppTheme.getTheme(type));
  }

  static AppColorStyle get appColorStyle {
    return AppColorStyle(AppThemeManager.currentAppThemeType);
  }

  static AppSizeStyle get appSizeStyle {
    return AppSizeStyle(AppThemeManager.currentAppThemeType);
  }

  static AppTextStyle get appTextStyle {
    return AppTextStyle(AppThemeManager.currentAppThemeType);
  }
}

extension ThemeDataExtension on ThemeData {
  AppColorStyle get appColorStyle {
    return AppThemeManager.appColorStyle;
  }

  AppSizeStyle get appSizeStyle {
    return AppThemeManager.appSizeStyle;
  }

  AppTextStyle get appTextStyle {
    return AppThemeManager.appTextStyle;
  }
}

extension BuildContextExtension on BuildContext {
  ThemeData get themeData {
    return Theme.of(this);
  }

  AppColorStyle get appColorStyle {
    return Theme.of(this).appColorStyle;
  }

  AppSizeStyle get appSizeStyle {
    return Theme.of(this).appSizeStyle;
  }

  AppTextStyle get appTextStyle {
    return Theme.of(this).appTextStyle;
  }
}
''';

    _makeFile(appThemeManagerPath, outData);
  }

  // 获取主题类型
  static List<String> _enumTheme(List<FileSystemEntity> children) {
    List<String> enumThemes = [];
    for (var element in children) {
      String fileName = File(element.path).fileNameWithoutExtension;
      enumThemes.add(fileName.split("-")[1]);
    }
    enumThemes.forEach(print);
    return enumThemes;
  }

  // 从xml文件中，解析颜色
  static Map<String, String> _findColor(File colorFile) {
    XmlDocument xmlDocument = XmlDocument.parse(colorFile.readAsStringSync());
    Map<String, String> colorMaps = <String, String>{};
    final colors = xmlDocument.findAllElements('color');
    for (var element in colors) {
      String colorName = element.attributes.firstWhere((e) {
        return e.name.toString() == "name";
      }).value;

      String colorString = element.innerText;
      colorString = colorString.replaceAll("#", "");
      if (colorString.length != 6 && colorString.length != 8) {
        throw "请用6位/8位的16进制颜色";
      }
      colorMaps[colorName] = colorString;
    }
    return colorMaps;
  }

  // 从xml文件中，解析大小
  static Map<String, String> _findSize(File sizeFile) {
    XmlDocument xmlDocument = XmlDocument.parse(sizeFile.readAsStringSync());
    Map<String, String> sizeMaps = <String, String>{};
    final dimens = xmlDocument.findAllElements('dimen');
    for (var element in dimens) {
      String sizeName = element.attributes.firstWhere((e) {
        return e.name.toString() == "name";
      }).value;

      String sizeString = element.innerText;
      try {
        int.parse(sizeString);
      } catch (e) {
        throw "请用纯数字来表示大小";
      }
      sizeMaps[sizeName] = sizeString;
    }
    return sizeMaps;
  }

  // 从xml文件中，解析文本样式
  static Map<String, _Text> _findText(File sizeFile) {
    XmlDocument xmlDocument = XmlDocument.parse(sizeFile.readAsStringSync());
    Map<String, _Text> textMaps = <String, _Text>{};
    final texts = xmlDocument.findAllElements('text');

    for (var element in texts) {
      String textName = element.attributes.firstWhere((e) {
        return e.name.toString() == "name";
      }).value;
      String color = element.findElements("color").first.innerText;
      String size = element.findElements("size").first.innerText;

      textMaps[textName] = _Text(color: color, size: size);
    }
    return textMaps;
  }

  // 生成文件
  static void _makeFile(String path, String outData) {
    // 判断目标文件是否存在
    File file = File(path);
    if (file.existsSync()) {
      print('目标文件已存在，删除后会重新生成：${file.path}');
      file.deleteSync();
    }
    file.createSync(recursive: true);
    file.writeAsString(outData);
    print('生成成功，生成路径：${file.path}');
  }
}

class _Text {
  String color;
  String size;

  _Text({required this.color, required this.size});
}

extension _FileExtension on File {
  /// 文件名，不包括后缀
  String get fileNameWithoutExtension {
    return path.basenameWithoutExtension(this.path);
  }
}

extension _StringExtension on String {
  /// 首字母大写
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// 首字母小写
  String lowercaseFirstLetter() {
    return "${this[0].toLowerCase()}${substring(1)}";
  }
}

// void main() {
//   ThemeMaker.makerThemeFiles(
//     directoryPath: 'theme',
//     targetFile: 'lib/comon/theme',
//   );
// }

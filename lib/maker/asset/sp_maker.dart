import 'dart:io';

/// 快速生成基于SharedPreferencesUtil生成保存模型
class SpMaker {
  /// 快速生成基于SharedPreferencesUtil生成保存模型
  /// [modelClassName] 模型类的名称
  /// [saveDirectoryPath] 模型工具类的保存目录
  static void makeAndSave({required String modelClassName, String saveDirectoryPath = "lib/src/utils"}) {
    var saveModelClassUtilFilePath = '${Directory(saveDirectoryPath).path}/${modelClassName}Util.dart';
    var saveModelClassUtilFile = File(saveModelClassUtilFilePath);
    print("保存的文件是否存在:${saveModelClassUtilFile.existsSync()}");
    if (saveModelClassUtilFile.existsSync()) {
      saveModelClassUtilFile.deleteSync();
      print("保存的文件已经删除，已删除。");
    }
    saveModelClassUtilFile.createSync(recursive: true);
    var result = SpMaker.maker(modelClassName: modelClassName);
    saveModelClassUtilFile.writeAsStringSync(result);
    print("保存的文件已生成成功，保存路径：${saveModelClassUtilFile.path}");
  }

  /// 快速生成基于SharedPreferencesUtil生成保存模型
  static String maker({required String modelClassName}) {
    return '''
import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ${modelClassName}Util {
  static String get _key => CustomCryptoUtil.encryptBase64("${modelClassName}Util_Save_${modelClassName}_Key");

  static Future<void> save$modelClassName($modelClassName ${modelClassName.substring(0, 1).toLowerCase() + modelClassName.substring(1)}) async {
    await SharedPreferencesUtil.setSerializable<$modelClassName>(_key, ${modelClassName.substring(0, 1).toLowerCase() + modelClassName.substring(1)});
  }

  static Future<$modelClassName?> get$modelClassName() async {
    return await SharedPreferencesUtil.getSerializable(_key, $modelClassName());
  }

  static Future<void> clear$modelClassName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, "");
  }
}''';
  }
}

main() {
  SpMaker.makeAndSave(modelClassName: "UserInfoModel");
}

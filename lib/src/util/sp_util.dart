import 'package:shared_preferences/shared_preferences.dart';

import 'base64_util.dart';

/// 模型序列化成String，并简单加密存储
/// 模型需要继承[SPSerializable]
class SharedPreferencesUtil {
  /// 是否进行简单加密
  static bool simpleEncryption = true;

  /// 保存模型
  static Future<void> setSerializable<T extends SPSerializable>(String key, T serializable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, serializable._writeObjectToJsonString());
  }

  /// 获取模型
  static Future<T?> getSerializable<T extends SPSerializable>(String key, T serializable) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(key);
    if (value?.isNotEmpty != true) {
      return null;
    }
    var result = serializable._readObjectFromJsonString(value!);
    if (result != null) {
      assert(result is T, "Failed to read object from JSON string: $result");
      return result as T;
    }
    return null;
  }
}

/// 如果子类需要使用extends，不能使用implements，不然会报错
/// 示例代码：
/// ```dart
///   @override
///   SPSerializable readObjectFromJsonString(String jsonString) {
///     return GlobalAppInfo.fromJson(json.decode(jsonString));
///   }
///
///   @override
///   String writeObjectToJsonString() {
///     return json.encode(toJson());
///   }
/// ```
abstract class SPSerializable {
  String _writeObjectToJsonString() {
    var jsonString = writeObjectToJsonString();
    if (SharedPreferencesUtil.simpleEncryption == false) {
      return jsonString;
    }
    return Base64Util.encryptBase64(jsonString);
  }

  SPSerializable? _readObjectFromJsonString(String jsonString) {
    try {
      if (SharedPreferencesUtil.simpleEncryption == false) {
        return readObjectFromJsonString(jsonString);
      }
      var rawJsonString = Base64Util.decryptBase64(jsonString);
      return readObjectFromJsonString(rawJsonString);
    } catch (e) {
      assert(false, "Failed to read object from JSON string: $e");
    }
    return null;
  }

  String writeObjectToJsonString();

  SPSerializable readObjectFromJsonString(String jsonString);
}

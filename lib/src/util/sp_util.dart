import 'package:flutter_rapid_development_kit/src/util/custom_crypto_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      return result as T;
    }
    return null;
  }
}

abstract class SPSerializable {
  String _writeObjectToJsonString() {
    var jsonString = writeObjectToJsonString();
    if (SharedPreferencesUtil.simpleEncryption == false) {
      return jsonString;
    }
    return CustomCryptoUtil.encryptBase64(jsonString);
  }

  SPSerializable? _readObjectFromJsonString(String jsonString) {
    try {
      if (SharedPreferencesUtil.simpleEncryption == false) {
        return readObjectFromJsonString(jsonString);
      }
      var rawJsonString = CustomCryptoUtil.decryptBase64(jsonString);
      return readObjectFromJsonString(rawJsonString);
    } catch (e) {
      assert(false, "Failed to read object from JSON string: $e");
    }
    return null;
  }

  String writeObjectToJsonString();

  SPSerializable readObjectFromJsonString(String jsonString);
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

class FFConvert {
  FFConvert._();
  static T? Function<T extends Object?>(dynamic value) convert = <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    return defaultValue;
  }

  return defaultValue;
}

class GlobalAppInfo extends SPSerializable {
  GlobalAppInfo({
    this.isFirstInstall,
  });

  factory GlobalAppInfo.fromJson(Map<String, dynamic> json) => GlobalAppInfo(
        isFirstInstall: asT<bool?>(json['isFirstInstall']),
      );

  bool? isFirstInstall;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'isFirstInstall': isFirstInstall,
      };

  GlobalAppInfo copy() {
    return GlobalAppInfo(
      isFirstInstall: isFirstInstall,
    );
  }

  @override
  SPSerializable readObjectFromJsonString(String jsonString) {
    return GlobalAppInfo.fromJson(json.decode(jsonString));
  }

  @override
  String writeObjectToJsonString() {
    return json.encode(toJson());
  }
}

import 'dart:convert';
import 'dart:developer';

class _FFConvert {
  _FFConvert._();

  static T? Function<T extends Object?>(dynamic value) convert = <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? convertT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if (T == String) {
        return valueS as T;
      } else if (T == int) {
        return int.parse(valueS) as T;
      } else if (T == double) {
        return double.parse(valueS) as T;
      } else if (T == bool) {
        final lowerValueS = valueS.toLowerCase();
        if (lowerValueS == '0' || lowerValueS == '1') {
          return (lowerValueS == '1') as T;
        }
        return (lowerValueS == 'true') as T;
      } else {
        return _FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    return defaultValue;
  }

  return defaultValue;
}

import 'package:intl/intl.dart';

extension FrdkDateTimeFormat on DateTime {
  /// 按[format]格式，转换成[String]
  String dateFormat({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).format(this);
  }
}

extension FrdkStringDateFormat on String {
  /// 按[format]格式解析字符串，转换成[DateTime]
  DateTime? toDateTime({String format = "yyyy-MM-dd HH:mm:ss"}) {
    try {
      return DateFormat(format).parse(this, format.contains("UTC"));
    } catch (e) {
      // assert(false, "无法解析日期时间: $this, 格式: $format, e: $e");
    }
    return null;
  }
}

import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  /// 按[format]格式，转换成[String]
  String dateFormat({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).format(this);
  }
}

extension StringDateFormat on String {
  /// 按[format]格式解析字符串，转换成[DateTime]
  DateTime toDateTime({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).parse(this);
  }
}

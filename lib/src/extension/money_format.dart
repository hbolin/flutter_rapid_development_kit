import 'package:intl/intl.dart';

extension MoneyDoubleFormat on double? {
  /// 默认的[format]实现：保留最多两位小数(舍弃末尾的0)，如:
  /// 3.345 -> 3.34
  /// 3.40 -> 3.4
  /// 3.0 -> 3
  String? moneyFormat({String format = "0.##"}) {
    if (this == null) return null;
    NumberFormat numberFormat = NumberFormat(format);
    return numberFormat.format(this);
  }
}

extension MoneyStringFormat on String? {
  /// 默认的[format]实现：保留最多两位小数(舍弃末尾的0)，如:
  /// 3.345 -> 3.34
  /// 3.40 -> 3.4
  /// 3.0 -> 3
  String? moneyFormat({String format = "0.##"}) {
    if (this == null) return null;
    NumberFormat numberFormat = NumberFormat(format);
    return numberFormat.format(double.parse(this!));
  }
}

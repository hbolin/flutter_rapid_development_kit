import 'package:intl/intl.dart';

/// #：表示该位没有数字时填空显示，有则直接显示；出现在小数位部分时，n个#只保留n位有效小数(比如1.00不保留，1.11则保留)
/// 0：表示该位没有数字时补零显示，有则直接显示；出现在小数位部分时，n个0表示保留n位小数
/// 如果需要保留2位的话，使用0.00
extension MoneyDoubleFormat on double {
  /// 默认的[format]实现：保留最多两位小数(舍弃末尾的0)，如:
  /// 3.345 -> 3.35 (四舍五入)
  /// 3.40 -> 3.4
  /// 3.0 -> 3
  String moneyFormat({String format = "0.##"}) {
    NumberFormat numberFormat = NumberFormat(format);
    return numberFormat.format(this);
  }
}

extension MoneyStringFormat on String {
  /// 默认的[format]实现：保留最多两位小数(舍弃末尾的0)，如:
  /// 3.345 -> 3.35 (四舍五入)
  /// 3.40 -> 3.4
  /// 3.0 -> 3
  String moneyFormat({String format = "0.##"}) {
    NumberFormat numberFormat = NumberFormat(format);
    return numberFormat.format(double.parse(this));
  }
}

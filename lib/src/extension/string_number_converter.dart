extension StringNumberConverter on String {
  /// [String]转换成[int]
  int? toIntOrNull() {
    return int.tryParse(this, radix: 10);
  }

  /// [String]转换成[double]
  double? toDoubleOrNull() {
    return double.tryParse(this);
  }

  /// [String]转换成[bool]
  bool toBoolOrNull({String? extraCondition}) {
    if (extraCondition != null) {
      return toLowerCase() == "true" || toLowerCase() == extraCondition;
    }
    return toLowerCase() == "true";
  }
}

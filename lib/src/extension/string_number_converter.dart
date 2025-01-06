extension FrdkStringNumberConverter on String {
  /// [String]转换成[int]
  int? toIntOrNull() {
    return int.tryParse(this, radix: 10);
  }

  /// [String]转换成[double]
  double? toDoubleOrNull() {
    return double.tryParse(this);
  }

  /// [String]转换成[bool]
  bool toBool({String? trueCondition}) {
    final lowerCaseValue = toLowerCase();
    if (trueCondition != null) {
      return lowerCaseValue == "true" || lowerCaseValue == trueCondition.toLowerCase();
    }
    return lowerCaseValue == "true";
  }
}

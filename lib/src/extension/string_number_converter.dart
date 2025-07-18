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
  bool toBool({String? extraTrueCondition}) {
    final lowerCaseValue = toLowerCase();
    if (extraTrueCondition != null) {
      return lowerCaseValue == "true" || lowerCaseValue == extraTrueCondition.toLowerCase();
    }
    return lowerCaseValue == "true";
  }
}

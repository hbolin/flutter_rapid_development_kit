extension StringNumberConversions on String? {
  /// [String]转换成[int]
  int? toIntOrNull() {
    if (this == null) return null;
    return int.tryParse(this!, radix: 10);
  }

  /// [String]转换成[double]
  double? toDoubleOrNull() {
    if (this == null) return null;
    return double.tryParse(this!);
  }

  /// [String]转换成[bool]
  bool? toBooleanOrNull({String? extraCondition}) {
    if (this == null) return null;
    if (extraCondition != null) {
      return this!.toLowerCase() == "true" || this!.toLowerCase() == extraCondition;
    }
    return this!.toLowerCase() == "true";
  }
}

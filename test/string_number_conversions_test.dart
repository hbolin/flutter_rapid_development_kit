import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toIntOrNull', () {
    String? testString = "ddd";
    expect(testString.toIntOrNull(), null);
    testString = "43";
    expect(testString.toIntOrNull(), 43);
    testString = null;
    expect(testString.toIntOrNull(), null);
  });

  test('toDoubleOrNull', () {
    String? testString = "ddd";
    expect(testString.toDoubleOrNull(), null);
    testString = "43";
    expect(testString.toDoubleOrNull(), 43);
    testString = "43.3";
    expect(testString.toDoubleOrNull(), 43.3);
    testString = null;
    expect(testString.toDoubleOrNull(), null);
  });

  test('toBooleanOrNull', () {
    String? testString = "ddd";
    expect(testString.toBooleanOrNull(), false);
    testString = "TRUE";
    expect(testString.toBooleanOrNull(), true);
    testString = "true";
    expect(testString.toBooleanOrNull(), true);
    testString = null;
    expect(testString.toBooleanOrNull(), null);
    testString = "1";
    expect(testString.toBooleanOrNull(extraCondition: "1"), true);
  });
}

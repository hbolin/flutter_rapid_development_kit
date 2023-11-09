import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dateFormat', () {
    DateTime? dateTime = DateTime(2023, 3, 21, 14, 15, 33);
    expect(dateTime.dateFormat(), "2023-03-21 14:15:33");
    dateTime = DateTime(2023, 3, 21, 14, 15, 33);
    expect(dateTime.dateFormat(format: "yyyy年MM月dd日 HH时mm分ss秒"), "2023年03月21日 14时15分33秒");
    dateTime = null;
    expect(dateTime.dateFormat(), null);
  });

  test('toDateTime', () {
    String? dateTime = "2023-03-21 14:15:33";
    expect(dateTime.toDateTime().toString(), DateTime(2023, 3, 21, 14, 15, 33).toString());
    dateTime = "2023年03月21日 14时15分33秒";
    expect(dateTime.toDateTime(format: "yyyy年MM月dd日 HH时mm分ss秒").toString(), DateTime(2023, 3, 21, 14, 15, 33).toString());
    dateTime = null;
    expect(dateTime.toDateTime(), null);
  });
}

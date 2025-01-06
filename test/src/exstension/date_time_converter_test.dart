import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:test/test.dart';

void main() {
  group('FrdkDateTimeFormat Extension', () {
    test('默认格式格式化日期时间', () {
      final dateTime = DateTime(2023, 10, 1, 12, 30, 45);
      expect(dateTime.dateFormat(), equals("2023-10-01 12:30:45"));
    });

    test('自定义格式格式化日期时间', () {
      final dateTime = DateTime(2023, 10, 1);
      expect(dateTime.dateFormat(format: "yyyy/MM/dd"), equals("2023/10/01"));
    });

    test('格式化包含时区的日期时间', () {
      final dateTime = DateTime.utc(2023, 10, 1, 12, 30, 45);
      expect(dateTime.dateFormat(format: "yyyy-MM-dd HH:mm:ss 'UTC'"), equals("2023-10-01 12:30:45 UTC"));
    });
  });

  group('FrdkStringDateFormat Extension', () {
    test('默认格式解析字符串为日期时间', () {
      final dateString = "2023-10-01 12:30:45";
      final dateTime = dateString.toDateTime();
      expect(dateTime, equals(DateTime(2023, 10, 1, 12, 30, 45)));
    });

    test('自定义格式解析字符串为日期时间', () {
      final dateString = "2023/10/01";
      final dateTime = dateString.toDateTime(format: "yyyy/MM/dd");
      expect(dateTime, equals(DateTime(2023, 10, 1)));
    });

    test('解析空字符串应返回 null', () {
      expect("".toDateTime(), isNull);
    });

    test('解析格式不匹配的字符串应返回 null', () {
      expect("2023-10-01".toDateTime(format: "yyyy/MM/dd"), isNull);
    });

    test('解析包含时区的字符串', () {
      final dateString = "2023-10-01 12:30:45 UTC";
      final dateTime = dateString.toDateTime(format: "yyyy-MM-dd HH:mm:ss 'UTC'");
      expect(dateTime, equals(DateTime.utc(2023, 10, 1, 12, 30, 45)));
    });

    test('解析无效日期字符串应返回 null', () {
      expect("2023年02月30日 12时30分45秒".toDateTime(), isNull);
    });
  });
}

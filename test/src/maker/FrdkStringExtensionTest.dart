import 'package:flutter_rapid_development_maker/flutter_rapid_development_maker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FrdkStringExtension', () {
    group('toUpperCaseFirstLetter', () {
      test('should return empty string when original is empty', () {
        expect(''.toUpperCaseFirstLetter(), equals(''));
      });

      test('should capitalize first letter of single character', () {
        expect('a'.toUpperCaseFirstLetter(), equals('A'));
      });

      test('should capitalize first letter of multi-character string', () {
        expect('hello'.toUpperCaseFirstLetter(), equals('Hello'));
      });

      test('should not modify already capitalized string', () {
        expect('World'.toUpperCaseFirstLetter(), equals('World'));
      });

      test('should handle strings with leading whitespace', () {
        expect(' hello'.toUpperCaseFirstLetter(), equals(' hello'));
      });

      test('should handle unicode characters', () {
        expect('étoile'.toUpperCaseFirstLetter(), equals('Étoile'));
      });
    });

    group('toLowerCaseFirstLetter', () {
      test('should return empty string when original is empty', () {
        expect(''.toLowerCaseFirstLetter(), equals(''));
      });

      test('should lowercase first letter of single character', () {
        expect('A'.toLowerCaseFirstLetter(), equals('a'));
      });

      test('should lowercase first letter of multi-character string', () {
        expect('Hello'.toLowerCaseFirstLetter(), equals('hello'));
      });

      test('should not modify already lowercase string', () {
        expect('world'.toLowerCaseFirstLetter(), equals('world'));
      });

      test('should handle strings with leading whitespace', () {
        expect(' World'.toLowerCaseFirstLetter(), equals(' World'));
      });

      test('should handle unicode characters', () {
        expect('Étoile'.toLowerCaseFirstLetter(), equals('étoile'));
      });
    });

    group('toCharList', () {
      test('should return empty list for empty string', () {
        expect(''.toCharList(), isEmpty);
      });

      test('should split ASCII string correctly', () {
        expect('abc'.toCharList(), equals(['a', 'b', 'c']));
      });

      test('should handle single character', () {
        expect('a'.toCharList(), equals(['a']));
      });

      test('should handle unicode characters correctly', () {
        expect('你好'.toCharList(), equals(['你', '好']));
      });

      test('should handle emoji characters', () {
        expect('👋🌍'.toCharList(), equals(['👋', '🌍']));
      });
    });
  });
}

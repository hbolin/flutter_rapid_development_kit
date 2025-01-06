import 'package:flutter_rapid_development_kit/flutter_rapid_development_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FrdkListExtensions with Person model', () {
    final person1 = Person(1, 'Alice');
    final person2 = Person(2, 'Bob');
    final person3 = Person(3, 'Charlie');
    final person4 = Person(4, 'David');
    final person5 = Person(3, 'Charlie'); // 与 person3 相同 id

    group('union', () {
      test('should return union of two lists without duplicates based on id', () {
        final list1 = [person1, person2, person3];
        final list2 = [person2, person3, person4, person5];
        final result = list1.union(list2, (a, b) => a.id == b.id);
        expect(result, [person1, person2, person3, person4]);
      });

      test('should return original list if other list is empty', () {
        final list1 = [person1, person2, person3];
        final list2 = <Person>[];
        final result = list1.union(list2, (a, b) => a.id == b.id);
        expect(result, [person1, person2, person3]);
      });

      test('should return other list if original list is empty', () {
        final list1 = <Person>[];
        final list2 = [person1, person2, person3];
        final result = list1.union(list2, (a, b) => a.id == b.id);
        expect(result, [person1, person2, person3]);
      });
    });

    group('subtract', () {
      test('should return difference of two lists based on id', () {
        final list1 = [person1, person2, person3];
        final list2 = [person2, person3, person4];
        final result = list1.subtract(list2, (a, b) => a.id == b.id);
        expect(result, [person1]);
      });

      test('should return original list if other list is empty', () {
        final list1 = [person1, person2, person3];
        final list2 = <Person>[];
        final result = list1.subtract(list2, (a, b) => a.id == b.id);
        expect(result, [person1, person2, person3]);
      });

      test('should return empty list if all elements are removed', () {
        final list1 = [person1, person2, person3];
        final list2 = [person1, person2, person3];
        final result = list1.subtract(list2, (a, b) => a.id == b.id);
        expect(result, []);
      });
    });

    group('intersect', () {
      test('should return intersection of two lists based on id', () {
        final list1 = [person1, person2, person3];
        final list2 = [person2, person3, person4];
        final result = list1.intersect(list2, (a, b) => a.id == b.id);
        expect(result, [person2, person3]);
      });

      test('should return empty list if no common elements', () {
        final list1 = [person1, person2];
        final list2 = [person3, person4];
        final result = list1.intersect(list2, (a, b) => a.id == b.id);
        expect(result, []);
      });

      test('should return empty list if other list is empty', () {
        final list1 = [person1, person2, person3];
        final list2 = <Person>[];
        final result = list1.intersect(list2, (a, b) => a.id == b.id);
        expect(result, []);
      });
    });

    group('indexOrNull', () {
      test('should return element at index if index is valid', () {
        final list = [person1, person2, person3];
        expect(list.indexOrNull(1), person2);
      });

      test('should return null if index is out of bounds', () {
        final list = [person1, person2, person3];
        expect(list.indexOrNull(3), isNull);
      });

      test('should return null if index is negative', () {
        final list = [person1, person2, person3];
        expect(list.indexOrNull(-1), isNull);
      });

      test('should return null if list is empty', () {
        final list = <Person>[];
        expect(list.indexOrNull(0), isNull);
      });
    });

    group('shallowCopy', () {
      test('should return a shallow copy of the list', () {
        final list = [person1, person2, person3];
        final copy = list.shallowCopy();
        expect(copy, [person1, person2, person3]);
        expect(copy, isNot(same(list))); // Ensure it's a new instance
      });

      test('should return an empty list if original list is empty', () {
        final list = <Person>[];
        final copy = list.shallowCopy();
        expect(copy, []);
      });
    });
  });
}

class Person {
  final int id;
  final String name;

  Person(this.id, this.name);

  // @override
  // bool operator ==(Object other) => identical(this, other) || other is Person && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Person(id: $id, name: $name)';
}

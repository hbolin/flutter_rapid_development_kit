import 'package:flutter_rapid_development_kit/org.phoenix.commons/extension/list_extension_operation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('shallowCopy', () {
    List<int> list = [1, 2, 3];
    expect(list.toString(), list.shallowCopy().toString());
    expect(list.hashCode, isNot(list.shallowCopy().hashCode));
  });

  test('union', () {
    List<int>? list = [1, 2, 3, 3];
    List<int> list2 = [2, 3, 3, 4];
    var result = list.union(list2, (element1, element2) => element1 == element2);
    print(result);
    expect(result.hashCode, isNot(list.hashCode));
    expect(result.hashCode, isNot(list2.hashCode));
    expect(result, [1, 2, 3, 3, 4]);
    list = null;
    expect(list.union(list2, (element1, element2) => element1 == element2), null);
  });

  test('subtract', () {
    List<int>? list = [1, 2, 3, 3];
    List<int> list2 = [2, 3, 3, 4];
    var result = list.subtract(list2, (element1, element2) => element1 == element2);
    print(result);
    expect(result.hashCode, isNot(list.hashCode));
    expect(result.hashCode, isNot(list2.hashCode));
    expect(result, [1]);
    list = null;
    expect(list.subtract(list2, (element1, element2) => element1 == element2), null);
  });

  test('intersect', () {
    List<int>? list = [1, 2, 3, 3];
    List<int> list2 = [2, 3, 3, 4];
    var result = list.intersect(list2, (element1, element2) => element1 == element2);
    print(result);
    expect(result.hashCode, isNot(list.hashCode));
    expect(result.hashCode, isNot(list2.hashCode));
    expect(result, [2, 3, 3]);
    list = null;
    expect(list.intersect(list2, (element1, element2) => element1 == element2), null);
  });
}

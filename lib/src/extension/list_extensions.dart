import 'package:collection/collection.dart';

extension ListExtensions<E> on List<E> {
  /// 并集，[removeSameElement]：表示的是移除的条件，例如element1.id == element2.id，id相同则保留一个即可
  /// 示例： [1, 2, 3, 3] 并集 [2, 3, 3, 4] = [1, 2, 3, 3, 4]
  /// 注意：只会添加[other]在本集合没有的元素，如果元素在本集合已重复，则还是会重复。
  /// 注意：不会影响[本集合]和[other]集合
  List<E> union(List<E> other, bool Function(E element1, E element2) removeSameElement) {
    var targetList = this.shallowCopy();
    var otherTemp = other.shallowCopy();
    otherTemp.removeWhere((element2) {
      var result = firstWhereOrNull((element1) => removeSameElement(element1, element2));
      return result != null;
    });
    targetList.addAll(otherTemp);
    return targetList;
  }

  /// 差集，[removeSameElement]：表示的是移除的条件，例如element1.id == element2.id，id相同则移除
  /// 示例： [1, 2, 3, 3] 差集 [2, 3, 3, 4] = [1]
  /// 注意：不会影响[本集合]和[other]集合
  List<E> subtract(List<E> other, bool Function(E element1, E element2) removeSameElement) {
    var targetList = this.shallowCopy();
    targetList.removeWhere((element2) {
      var result = other.firstWhereOrNull((element1) => removeSameElement(element1, element2));
      return result != null;
    });
    return targetList;
  }

  /// 交集，[pickSameElement]：表示的是取出的条件，例如element1.id == element2.id，id相同则取出
  /// 示例： [1, 2, 3, 3] 交集 [2, 3, 3, 4] = [2, 3, 3]
  /// 注意：不会影响[本集合]和[other]集合
  List<E> intersect(List<E> other, bool Function(E element1, E element2) pickSameElement) {
    return where((element2) {
      var result = other.firstWhereOrNull((element1) => pickSameElement(element1, element2));
      return result != null;
    }).toList();
  }

  /// 浅拷贝
  List<E> shallowCopy() {
    return <E>[...this];
  }

  /// 获取index的数据，如果list本身为null，则返回null；超出list的长度，也返回null
  E? indexOrNull(int index) {
    return elementAtOrNull(index);
  }
}
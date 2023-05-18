extension MapExtensionOperation<K, V> on Map<K, V>? {
  /// 获取key的数据，如果map本身为null，则返回null
  V? getValueOrNull(dynamic key) {
    if (this == null) return null;
    return this![key];
  }
}

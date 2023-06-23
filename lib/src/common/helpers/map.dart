extension MapExt<K, V> on Map<K, V> {
  void removeNull() => removeWhere((_, V v) => v == null);
}

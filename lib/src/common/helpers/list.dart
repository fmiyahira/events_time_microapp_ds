extension ListExt<K, V> on List<V> {
  void removeNull() => removeWhere((dynamic v) => v == null);
}

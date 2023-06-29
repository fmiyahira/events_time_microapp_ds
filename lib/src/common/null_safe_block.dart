extension NullSafeBlock<T> on T? {
  void let(Function(T it) runnable) {
    final T? instance = this;
    if (instance != null) {
      runnable(instance);
    }
  }

  T orElse(T? orElse) => this ?? orElse!;
}

abstract interface class CompositeLogger {
  void i(String message);

  void e(
      String message, [
        Object? error,
        StackTrace? stackTrace,
      ]);
}
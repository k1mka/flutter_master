import 'package:flutter_master/core/logger/composite_logger.dart';
import 'package:logger/logger.dart';

class CompositeLoggerImpl implements CompositeLogger {
  CompositeLoggerImpl({required this.logger});

  final Logger logger;

  @override
  void i(String message) {
    logger.i(message);
  }

  @override
  void e(
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }
}

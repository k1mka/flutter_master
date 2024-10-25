import 'package:flutter/material.dart';
import 'package:flutter_master/core/logger/composite_logger.dart';

class CompositeLoggerHolder extends InheritedWidget {
  const CompositeLoggerHolder({
    super.key,
    required super.child,
    required this.compositeLogger,
  });

  final CompositeLogger compositeLogger;

  static CompositeLogger of(BuildContext context) {
    final CompositeLoggerHolder? result =
        context.dependOnInheritedWidgetOfExactType<CompositeLoggerHolder>();
    assert(result != null, 'No CompositeLoggerHolder found in context');
    return result!.compositeLogger;
  }

  @override
  bool updateShouldNotify(CompositeLoggerHolder oldWidget) =>
      compositeLogger != oldWidget.compositeLogger;
}

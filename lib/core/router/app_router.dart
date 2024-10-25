import 'package:flutter_master/core/templates/typedefs.dart';

abstract interface class AppRouter {
  Future<void> push(
    String routeName, {
    StringMap? pathParameters,
    StringMap? parameters,
    JsonMap? extra,
  });

  void pop<T>([
    T result,
  ]);

  void popUntil<T>(
    String routeName,
  );

  void to(
    String routeName, {
    StringMap? pathParameters,
    StringMap? parameters,
    JsonMap? extra,
  });

  Future<void> replace(
    String routeName, {
    StringMap? pathParameters,
    StringMap? parameters,
  });

  Future<void> popUntilReplacement(
    String routeName, {
    StringMap? parameters,
  });
}

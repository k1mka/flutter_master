import 'package:flutter_master/core/router/app_router.dart';
import 'package:flutter_master/core/router/router.dart';
import 'package:flutter_master/core/templates/typedefs.dart';
import 'package:go_router/go_router.dart';

class GoAppRouter implements AppRouter {
  @override
  Future<void> push(
    String routeName, {
    StringMap? pathParameters,
    StringMap? parameters,
    JsonMap? extra,
  }) =>
      goRouter.pushNamed(
        routeName,
        pathParameters: pathParameters ?? {},
        extra: extra,
      );

  @override
  void pop<T>([T? result]) => goRouter.pop<T>(result);

  @override
  void popUntil<T>(
    String routeName,
  ) {
    final GoRouterDelegate delegate = goRouter.routerDelegate;
    final routes = delegate.currentConfiguration.routes;

    for (var i = 0; i < routes.length; i++) {
      final route = routes[i] as GoRoute;
      if (route.name == routeName) break;
      goRouter.pop();
    }
  }

  @override
  void to(
    String routeName, {
    StringMap? pathParameters,
    StringMap? parameters,
    JsonMap? extra,
  }) =>
      goRouter.goNamed(
        routeName,
        pathParameters: pathParameters ?? {},
        queryParameters: parameters ?? {},
        extra: extra,
      );

  @override
  Future<void> replace(
    String routeName, {
    StringMap? pathParameters,
    StringMap? parameters,
  }) =>
      goRouter.replaceNamed(
        routeName,
        pathParameters: pathParameters ?? {},
        queryParameters: parameters ?? {},
      );

  @override
  Future<void> popUntilReplacement(
    String routeName, {
    StringMap? parameters,
  }) async {
    while (goRouter.canPop()) {
      goRouter.pop();
    }
    return replace(routeName, parameters: parameters);
  }
}

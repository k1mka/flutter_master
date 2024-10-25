import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_master/setup_service_locator.dart';
import 'package:flutter_master/ui/auth_screen/auth_screen.dart';
import 'package:flutter_master/ui/personal_statistic_screen/personal_statistic_screen.dart';
import 'package:flutter_master/ui/survey_screen/survey_screen.dart';
import 'package:go_router/go_router.dart';

final routerKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  redirect: _authRedirect,
  navigatorKey: routerKey,
  initialLocation: AuthScreen.routeName,
  routes: [
    GoRoute(
      name: AuthScreen.routeName,
      path: AuthScreen.routeName,
      builder: (context, state) => const AuthScreen(),
      routes: [
        GoRoute(
          name: PersonalStatisticScreen.routeName,
          path: PersonalStatisticScreen.routeName,
          builder: (context, state) => const PersonalStatisticScreen(),
        ),
      ],
    ),
    GoRoute(
      name: SurveyScreen.routeName,
      path: SurveyScreen.routeName,
      builder: (context, state) => const SurveyScreen(),
    ),
  ],
);

FutureOr<String?> _authRedirect(
  BuildContext context,
  GoRouterState state,
) async {
  final repository = getRepo;
  final userId = await repository.getUserId();
  final isUserAuthorized = userId != null && userId.isNotEmpty;
  return isUserAuthorized ? SurveyScreen.routeName : AuthScreen.routeName;
}

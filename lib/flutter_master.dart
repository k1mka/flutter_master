import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_master/core/logger/composite_logger_holder.dart';
import 'package:flutter_master/core/router/app_router_holder.dart';
import 'package:flutter_master/core/router/router.dart';
import 'package:flutter_master/core/theme/palette.dart';
import 'package:flutter_master/setup_service_locator.dart';

class FlutterMaster extends StatelessWidget {
  const FlutterMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Master',
      routerConfig: goRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.white,
      ),
      builder: (context, router) => AppRouterHolder(
        router: getRouter,
        child: CompositeLoggerHolder(
          compositeLogger: getLogger,
          child: router!,
        ),
      ),
    );
  }
}

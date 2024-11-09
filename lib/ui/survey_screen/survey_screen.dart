import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/setup_service_locator.dart';
import 'package:flutter_master/ui/survey_screen/cubit/survey_cubit.dart';
import 'package:flutter_master/ui/survey_screen/survey_layout.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  static const routeName = 'SurveyScreen';

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SurveyCubit(getRepo),
        child: const SurveyLayout(),
      );
}

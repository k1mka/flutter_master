import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/ui/survey_screen/cubit/survey_cubit.dart';
import 'package:flutter_master/ui/survey_screen/cubit/survey_state.dart';
import 'package:flutter_master/ui/widgets/atoms/progress_template.dart';
import 'package:flutter_master/ui/widgets/pages/survey_page.dart';

class SurveyLayout extends StatelessWidget {
  const SurveyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SurveyCubit, SurveyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return switch (state) {
            SurveyInitial() => const SizedBox.shrink(),
            SurveyLoading() => const ProgressTemplate(),
            SurveySuccessLoaded() => SurveyPage(
                question: state.question,
                onSuccessPressed: () async => context.read<SurveyCubit>().uploadNewQuestion(),
                onFailPressed: () async => context.read<SurveyCubit>().registerFail(state.question),
              ),
          };
        },
      ),
    );
  }
}

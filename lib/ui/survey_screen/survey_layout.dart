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
    final cubit = context.read<SurveyCubit>();
    return Scaffold(
      body: BlocBuilder<SurveyCubit, SurveyState>(
        builder: (_, state) {
          return switch (state) {
            SurveyInitial() => const SizedBox.shrink(),
            SurveyLoading() => const ProgressTemplate(),
            SurveySuccessLoaded() => SurveyPage(
                question: state.question.text,
                onSuccessPressed: () async =>
                    cubit.registerCorrectAnswer(questionId: state.question.id, isCorrect: true),
                onFailPressed: () async => cubit.registerFail(
                  isCorrect: false,
                  questionId: state.question.id,
                  questionText: state.question.text,
                ),
              ),
          };
        },
      ),
    );
  }
}

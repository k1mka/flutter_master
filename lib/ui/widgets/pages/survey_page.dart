import 'package:flutter/material.dart';
import 'package:flutter_master/ui/widgets/atoms/app_wrapper.dart';
import 'package:flutter_master/ui/widgets/atoms/question_card_widget.dart';
import 'package:flutter_master/ui/widgets/moleculs/survey_actions.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({
    super.key,
    required this.question,
    required this.onSuccessPressed,
    required this.onFailPressed,
  });

  final String question;

  final VoidCallback onSuccessPressed;
  final VoidCallback onFailPressed;

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QuestionCardWidget(question: question),
          Spacings.spacer12,
          SurveyActions(
            onSuccessPressed: onSuccessPressed,
            onFailPressed: onFailPressed,
          ),
        ],
      ),
    );
  }
}

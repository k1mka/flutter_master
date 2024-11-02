import 'package:flutter/material.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/ui/widgets/atoms/app_wrapper.dart';
import 'package:flutter_master/ui/widgets/atoms/custom_button.dart';
import 'package:flutter_master/ui/widgets/atoms/custom_icon_button.dart';
import 'package:flutter_master/ui/widgets/atoms/question_card_widget.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class SurveyLayout extends StatelessWidget {
  const SurveyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionCardWidget(
              question:
                  'Что такое абстрактный класс? Можем ли создать экземпляр абстрактного класса?',
            ),
            Spacings.spacer12,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton.success(
                  label: context.s.successful,
                  onPressed: () {
                    // TODO(George): implement later
                  },
                ),
                Spacings.spacer24,
                CustomIconButton.error(
                  label: context.s.fail,
                  onPressed: () {
                    // TODO(George): implement later
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/core/theme/palette.dart';
import 'package:flutter_master/ui/personal_statistic_screen/personal_statistic_screen.dart';
import 'package:flutter_master/ui/survey_screen/survey_screen.dart';
import 'package:flutter_master/ui/widgets/atoms/app_wrapper.dart';
import 'package:flutter_master/ui/widgets/atoms/custom_button.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => AppWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () => context.r.push(SurveyScreen.routeName),
              buttonColor: Palette.greenColor,
              text: context.s.start_new_survey,
            ),
            Spacings.spacer24,
            CustomButton(
              onPressed: () =>
                  context.r.push(PersonalStatisticScreen.routeName),
              buttonColor: Colors.lightBlueAccent,
              text: context.s.go_to_statistics,
            ),
          ],
        ),
      );
}

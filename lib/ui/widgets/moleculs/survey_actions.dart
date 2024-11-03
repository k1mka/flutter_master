import 'package:flutter/material.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/ui/widgets/atoms/custom_icon_button.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class SurveyActions extends StatelessWidget {
  const SurveyActions({
    super.key,
    required this.onSuccessPressed,
    required this.onFailPressed,
  });

  final VoidCallback onSuccessPressed;
  final VoidCallback onFailPressed;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton.success(
            label: context.s.successful,
            onPressed: onSuccessPressed,
          ),
          Spacings.spacer24,
          CustomIconButton.error(
            label: context.s.fail,
            onPressed: onFailPressed,
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/core/theme/palette.dart';
import 'package:flutter_master/core/theme/text_styles.dart';
import 'package:flutter_master/ui/widgets/tokens/radiuses.dart';

class QuestionCardWidget extends StatelessWidget {
  const QuestionCardWidget({super.key, required this.question});

  final String question;

  static const _borderWidth = 2.0;
  static const _cardSize = 220.0;
  static const _blurRadius = 8.0;

  @override
  Widget build(BuildContext context) => Container(
        height: _cardSize,
        width: context.w,
        decoration: BoxDecoration(
          color: Palette.lightGrey,
          borderRadius: Radiuses.borderRadius12,
          border: Border.all(
            color: Colors.grey,
            width: _borderWidth,
          ),
          boxShadow: const [
            BoxShadow(color: Palette.lightBlue, blurRadius: _blurRadius),
          ],
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            style: TextStyles.bigStyle,
            question,
          ),
        ),
      );
}

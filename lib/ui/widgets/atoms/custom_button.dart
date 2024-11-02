import 'package:flutter/material.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/core/theme/palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text, this.buttonColor});

  final String text;
  final VoidCallback onPressed;

  final Color? buttonColor;

  static const _iconSize = 48.0;
  static const _textStyle = TextStyle(color: Palette.white);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _iconSize,
      width: context.w,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(buttonColor ?? Palette.blueColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: _textStyle,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_master/core/theme/palette.dart';

abstract class TextStyles {
  static TextStyle get testTextStyle => const TextStyle(
        fontSize: 18,
        color: Palette.blurTextColor,
        fontWeight: FontWeight.w400,
      );
}

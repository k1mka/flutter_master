import 'package:flutter/material.dart';
import 'package:flutter_master/core/theme/palette.dart';

abstract class TextStyles {
  static TextStyle get bigStyle => const TextStyle(
        fontSize: 24,
        color: Palette.lightBlue,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get mediumStyle => const TextStyle(
    fontSize: 18,
    color: Palette.grey,
    fontWeight: FontWeight.w400,
  );
}

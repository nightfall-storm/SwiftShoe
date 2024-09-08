import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AkChipTheme {
  AkChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AkColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AkColors.black),
    selectedColor: AkColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AkColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AkColors.darkerGrey,
    labelStyle: TextStyle(color: AkColors.white),
    selectedColor: AkColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: AkColors.white,
  );
}

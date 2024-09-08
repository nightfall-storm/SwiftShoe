import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class AkElevatedButtonTheme {
  AkElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AkColors.light,
      backgroundColor: AkColors.primary,
      disabledForegroundColor: AkColors.darkGrey,
      disabledBackgroundColor: AkColors.buttonDisabled,
      side: const BorderSide(color: AkColors.primary),
      padding: const EdgeInsets.symmetric(vertical: AkSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: AkColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AkSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AkColors.light,
      backgroundColor: AkColors.primary,
      disabledForegroundColor: AkColors.darkGrey,
      disabledBackgroundColor: AkColors.darkerGrey,
      side: const BorderSide(color: AkColors.primary),
      padding: const EdgeInsets.symmetric(vertical: AkSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: AkColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AkSizes.buttonRadius)),
    ),
  );
}

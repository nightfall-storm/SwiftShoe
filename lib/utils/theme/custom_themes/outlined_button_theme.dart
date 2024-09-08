import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class AkOutlinedButtonTheme {
  AkOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AkColors.dark,
      side: const BorderSide(color: AkColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: AkColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: AkSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AkSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AkColors.light,
      side: const BorderSide(color: AkColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: AkColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: AkSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AkSizes.buttonRadius)),
    ),
  );
}

import 'package:shoes_store/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:shoes_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:shoes_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:shoes_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:shoes_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:shoes_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:shoes_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:shoes_store/utils/theme/custom_themes/text_field_theme.dart';
import '../constants/colors.dart';

class AkAppTheme {
  AkAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AkColors.grey,
    brightness: Brightness.light,
    primaryColor: AkColors.primary,
    textTheme: AkTextTheme.lightTextTheme,
    chipTheme: AkChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AkColors.white,
    appBarTheme: AkAppBarTheme.lightAppBarTheme,
    checkboxTheme: AkCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AkBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AkElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AkOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AkTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AkColors.grey,
    brightness: Brightness.dark,
    primaryColor: AkColors.primary,
    textTheme: AkTextTheme.darkTextTheme,
    chipTheme: AkChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AkColors.black,
    appBarTheme: AkAppBarTheme.darkAppBarTheme,
    checkboxTheme: AkCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AkBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AkElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AkOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AkTextFormFieldTheme.darkInputDecorationTheme,
  );
}

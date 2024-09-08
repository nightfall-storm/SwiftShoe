import 'package:flutter/material.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class AkAppBarTheme{
  AkAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AkColors.black, size: AkSizes.iconMd),
    actionsIconTheme: IconThemeData(color: AkColors.black, size: AkSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AkColors.black),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AkColors.black, size: AkSizes.iconMd),
    actionsIconTheme: IconThemeData(color: AkColors.white, size: AkSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: AkColors.white),
  );
}
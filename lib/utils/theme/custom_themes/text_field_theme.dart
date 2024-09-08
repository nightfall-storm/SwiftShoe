import 'package:flutter/material.dart';
import 'package:shoes_store/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class AkTextFormFieldTheme {
  AkTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AkColors.darkGrey,
    suffixIconColor: AkColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: AkSizes.fontSizeMd, color: AkColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: AkSizes.fontSizeSm, color: AkColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: AkColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AkColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AkColors.darkGrey,
    suffixIconColor: AkColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: AkSizes.fontSizeMd, color: AkColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: AkSizes.fontSizeSm, color: AkColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: AkColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AkColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AkColors.warning),
    ),
  );
}

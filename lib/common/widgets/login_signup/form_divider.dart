import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../utils/constants/text_strings.dart';
class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(
            child: Divider(
                color: dark ? AkColors.darkGrey : AkColors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5)),
        Text(AkTexts.orSignInWith.capitalize!),
        Flexible(
            child: Divider(
                color: dark ? AkColors.darkGrey : AkColors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 60)),
      ],
    );
  }
}

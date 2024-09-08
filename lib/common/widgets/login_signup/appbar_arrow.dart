import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class AppBarArrow extends StatelessWidget {
  const AppBarArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = AkHelperFunctions.isDarkMode(context);
    return IconButton(
        icon: Icon(color: dark ? AkColors.white : AkColors.black, Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      );
  }
}

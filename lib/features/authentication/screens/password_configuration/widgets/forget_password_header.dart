import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image:
              AssetImage(dark ? AkImages.darkAppLogo : AkImages.lightAppLogo),
        ),
        Text(AkTexts.forgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        Text(AkTexts.forgetPasswordSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

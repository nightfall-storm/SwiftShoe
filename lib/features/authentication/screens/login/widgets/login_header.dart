import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
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
        Text(AkTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        Text(AkTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: AkSizes.spaceBtwItems),
      ],
    );
  }
}

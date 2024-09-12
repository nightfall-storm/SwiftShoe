import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({
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
        const SizedBox(height: AkSizes.spaceBtwSections),
        Text(AkTexts.signupTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        Text(AkTexts.signupSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: AkSizes.spaceBtwSections / 2),
      ],
    );
  }
}

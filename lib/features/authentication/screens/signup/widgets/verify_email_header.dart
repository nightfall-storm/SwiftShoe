import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class VerifyEmailHeader extends StatelessWidget {
  const VerifyEmailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AkImages.deliveredEmailIllustration,
          width: AkHelperFunctions.screenWidth() * 0.6,
        ),
        const SizedBox(height: AkSizes.spaceBtwItems),
        Text(AkTexts.confirmEmail,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center),
        Text('toto-soso@gmail.com',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center),
        Text(AkTexts.confirmEmailSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center),
      ],
    );
  }
}

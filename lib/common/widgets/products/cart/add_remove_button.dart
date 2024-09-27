import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../Icon/circular_icon.dart';

class AkProductQuantityWithAddRemove extends StatelessWidget {
  const AkProductQuantityWithAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AkCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AkSizes.md,
          backgroundColor:
              AkHelperFunctions.isDarkMode(context)
                  ? AkColors.darkerGrey
                  : AkColors.light,
          iconColor: AkHelperFunctions.isDarkMode(context)
              ? AkColors.white
              : AkColors.black,
        ),
        const SizedBox(width: AkSizes.spaceBtwItems),
        Text('2',
            style:
                Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: AkSizes.spaceBtwItems),
        const AkCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AkSizes.md,
          backgroundColor: AkColors.primary,
          iconColor: AkColors.white,
        ),
      ],
    );
  }
}

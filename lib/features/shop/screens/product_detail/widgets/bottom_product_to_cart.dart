import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/Icon/circular_icon.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AkBottomAddToCart extends StatelessWidget {
  const AkBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AkSizes.defaultSpace, vertical: AkSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDarkMode ? AkColors.darkContainer : AkColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AkSizes.borderRadiusLg),
          topRight: Radius.circular(AkSizes.borderRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const AkCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: AkColors.darkerGrey,
                width: 40,
                height: 40,
                iconColor: AkColors.white,
              ),
              const SizedBox(width: AkSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: AkSizes.spaceBtwItems),
              const AkCircularIcon(
                icon: Iconsax.add,
                backgroundColor: AkColors.darkerGrey,
                width: 40,
                height: 40,
                iconColor: AkColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(AkSizes.md),
              backgroundColor: AkColors.black,
              side: const BorderSide(color: AkColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

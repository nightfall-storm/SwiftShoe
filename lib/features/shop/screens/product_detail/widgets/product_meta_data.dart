import 'package:flutter/material.dart';


import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_verified_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AkProductMetaData extends StatelessWidget {
  const AkProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * Price And Sale Price
        Row(
          children: [
            // ? Sale Tag
            AkRoundedContainer(
              borderRadius: BorderRadius.circular(AkSizes.sm),
              backgroundColor: const Color(0xFF009AA6).withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AkSizes.sm, vertical: AkSizes.xs),
              child: Text(
                '30%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: AkColors.black),
              ),
            ),
            const SizedBox(width: AkSizes.spaceBtwItems),
            // ? Price
            Text('\$250',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: AkSizes.spaceBtwItems),
            const AkProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(width: AkSizes.spaceBtwItems),
        // * Title
        const AkProductTitleText(title: 'Green Nike Sports Shoes'),
        const SizedBox(width: AkSizes.spaceBtwItems),

        // * Stock Status
        Row(children: [
          const AkProductTitleText(title: 'Status :'),
          const SizedBox(width: AkSizes.spaceBtwItems),
          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
        ]),
        const SizedBox(width: AkSizes.spaceBtwItems),

        // * Brand
        Row(
          children: [
            AkCircularImage(
                image: AkImages.nikeLogo,
                height: 32,
                width: 32,
                overlayColor: isDarkMode ? AkColors.white : AkColors.black),
            const AkBrandTitleWithVerifiedIcon(title: 'Nike ', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}

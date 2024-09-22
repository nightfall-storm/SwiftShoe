import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:shoes_store/common/styles/shadows_style.dart';
import 'package:shoes_store/common/widgets/containers/rounded_container.dart';
import 'package:shoes_store/common/widgets/images/round_image.dart';
import 'package:shoes_store/utils/constants/image_strings.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../Icon/circular_icon.dart';
import '../../texts/brand_title_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class AkProductCardVertical extends StatelessWidget {
  const AkProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AkHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        height: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [AkShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AkSizes.productImageRadius),
          color: isDarkMode ? AkColors.darkContainer : AkColors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // * Thumbnail Image
                const AkRoundedImage(
                  imageUrl: AkImages.productImage1,
                  height: 180,
                  backgroundColor: AkColors.lightContainer,
                ),
                // * Discount TAG
                Positioned(
                  top: 17,
                  left: 3,
                  child: Transform.rotate(
                    angle: -3.14 / 2,
                    child: AkRoundedContainer(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AkSizes.md),
                        bottomLeft: Radius.circular(AkSizes.md),
                        topRight: Radius.zero,
                        bottomRight: Radius.zero,
                      ),
                      backgroundColor: const Color(0xFF009AA6).withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AkSizes.sm,
                        vertical: AkSizes.xs,
                      ),
                      child: Text(
                        '30% OFF',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AkColors.white),
                      ),
                    ),
                  ),
                ),
                // ? Favorite icon Button
                const Positioned(
                  top: 3, 
                  right: 8, 
                  child: AkCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                    backgroundColor: AkColors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AkSizes.spaceBtwItems / 2),
            // * Details Section
            const Padding(
              padding: EdgeInsets.only(left: AkSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AkProductTitleText(
                      title: 'Green Nike Air Shoes', smallSize: true),
                  SizedBox(height: AkSizes.spaceBtwItems / 2),
                  AkBrandTitleWithVerifiedIcon(title: 'Nike',textAlign: TextAlign.start,mainAxisSize: MainAxisSize.max),
                ],
              ),
            ),
            // ? Spacer to keep the height of each box same in case 1 or 2 heading lines
            const Spacer(),
            // ? Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: AkSizes.sm),
                  child: AkProductPriceText(
                    price: '35.0',
                    isLarge: true,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AkColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AkSizes.cardRadiusMd),
                      bottomRight: Radius.circular(AkSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: AkSizes.iconLg * 1.1,
                    height: AkSizes.iconLg * 1.1,
                    child: Center(
                      child: Icon(Iconsax.add, color: AkColors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


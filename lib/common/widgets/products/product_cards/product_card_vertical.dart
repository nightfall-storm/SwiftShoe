// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:shoes_store/common/styles/shadows_style.dart';
import 'package:shoes_store/common/widgets/containers/rounded_container.dart';
import 'package:shoes_store/common/widgets/images/round_images.dart';
import 'package:shoes_store/utils/constants/image_strings.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../Icon/circular_icon.dart';
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
                // Favorite icon Button
                const Positioned(
                  top: 3, // Adjust the position to align better
                  right: 8, // Add some spacing from the edge
                  child: AkCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                    backgroundColor: AkColors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AkSizes.spaceBtwItems / 2),
            // Details Section
            Padding(
              padding: const EdgeInsets.only(left: AkSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AkProductTitleText(
                      title: 'Green Nike Air Shoes', smallSize: true),
                  const SizedBox(height: AkSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'Nike',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: AkSizes.xs),
                      const Icon(Iconsax.verify5,
                          color: AkColors.primary, size: AkSizes.iconXs),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AkProductPriceText(
                        price: '35.0',
                        isLarge: true,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AkColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AkSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(AkSizes.productImageRadius),
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
          ],
        ),
      ),
    );
  }
}

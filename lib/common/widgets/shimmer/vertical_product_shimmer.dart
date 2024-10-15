import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/layouts/grid_layout.dart';
import 'package:shoes_store/common/widgets/shimmer/shimmer.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import 'package:shoes_store/utils/constants/colors.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../styles/shadows_style.dart';

class AkVerticalProductShimmer extends StatelessWidget {
  const AkVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final isDark = AkHelperFunctions.isDarkMode(context);
    return AkGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: isDark ? null : [AkShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AkSizes.productImageRadius),
          color: isDark ? AkColors.darkContainer : AkColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail
            const AkShimmerEffect(
              width: 180,
              height: 180,
              radius: AkSizes.productImageRadius,
            ),
            const SizedBox(height: AkSizes.spaceBtwItems / 2),

            /// Title
            const Padding(
              padding: EdgeInsets.only(left: AkSizes.sm),
              child: AkShimmerEffect(width: 160, height: 15),
            ),
            const SizedBox(height: AkSizes.spaceBtwItems / 2),

            /// Brand
            const Padding(
              padding: EdgeInsets.only(left: AkSizes.sm),
              child: AkShimmerEffect(width: 110, height: 15),
            ),

            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: AkSizes.sm),
                  child: AkShimmerEffect(width: 80, height: 20),
                ),

                /// Add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: AkColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AkSizes.cardRadiusMd),
                      bottomRight: Radius.circular(AkSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: AkSizes.iconLg * 1.2,
                    height: AkSizes.iconLg * 1.2,
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
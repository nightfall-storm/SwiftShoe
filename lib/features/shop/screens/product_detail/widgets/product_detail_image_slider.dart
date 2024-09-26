import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/Icon/circular_icon.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/round_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AkProductImageSlider extends StatelessWidget {
  const AkProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return AkCurvedEdges(
        child: Container(
      color: isDarkMode ? AkColors.darkContainer : AkColors.light,
      child: Stack(
        children: [
          // ? Main Large Image
          const SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(AkSizes.productImageRadius * 2),
              child: Center(
                child: Image(
                  image: AssetImage(AkImages.productImage1),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            left: AkSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(
                  width: AkSizes.spaceBtwItems,
                ),
                itemCount: 6,
                itemBuilder: (_, index) => AkRoundedImage(
                    width: 80,
                    backgroundColor:
                        isDarkMode ? AkColors.darkContainer : AkColors.white,
                    border: Border.all(color: AkColors.primary),
                    padding: const EdgeInsets.all(AkSizes.sm),
                    imageUrl: AkImages.productImage3),
              ),
            ),
          ),
          AkAppBar(
            onPressed: () => Get.back(),
            actions: const [
              Padding(
                  padding: EdgeInsets.only(right: AkSizes.md),
                  child: AkCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    ));
  }
}

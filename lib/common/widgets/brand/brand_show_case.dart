import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../containers/rounded_container.dart';
import 'brand_card.dart';

class AkBrandShowcase extends StatelessWidget {
  const AkBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return AkRoundedContainer(
      showBorder: true,
      borderColor: AkColors.darkGrey,
      backgroundColor: Colors.transparent,
      borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
      margin: const EdgeInsets.only(bottom: AkSizes.spaceBtwItems),
      padding: const EdgeInsets.all(AkSizes.md),
      child: Column(
        children: [
          // * Brand with products counts
          const AkBrandCard(showBorder: false),
          const SizedBox(height: AkSizes.spaceBtwItems),
          // * Brand Top 3 Products Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: AkRoundedContainer(
    height: 100,
    borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
    padding: const EdgeInsets.all(AkSizes.md),
    margin: const EdgeInsets.only(left: AkSizes.sm,right: AkSizes.sm ),
    backgroundColor: AkHelperFunctions.isDarkMode(context)
        ? AkColors.darkContainer
        : AkColors.light,
    child: Image(fit: BoxFit.contain, image: AssetImage(image)),
  ));
}

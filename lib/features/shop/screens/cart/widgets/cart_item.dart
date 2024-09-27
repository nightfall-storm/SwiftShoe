import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/round_image.dart';
import '../../../../../common/widgets/texts/brand_title_verified_icon.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AkCartItem extends StatelessWidget {
  const AkCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // * Image
        AkRoundedImage(
          imageUrl: AkImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AkSizes.sm),
          backgroundColor:
              AkHelperFunctions.isDarkMode(context)
                  ? AkColors.darkContainer
                  : AkColors.light,
        ),
        const SizedBox(width: AkSizes.spaceBtwItems),
    
        // * Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AkBrandTitleWithVerifiedIcon(title: 'Nike '),
              const Flexible(child: AkProductTitleText(title: 'Green Sport Shoe', maxLines: 1)),
              
              // * Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'EU 38 ', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                )
              )
            ],
          ),
        )
      ],
    );
  }
}

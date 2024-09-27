import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/containers/rounded_container.dart';
import 'package:shoes_store/common/widgets/containers/section_cotainer.dart';
import 'package:shoes_store/common/widgets/texts/product_price_text.dart';
import 'package:shoes_store/common/widgets/texts/product_title_text.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chip/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AkProductAttributes extends StatelessWidget {
  const AkProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // * Selected Attribute Pricing & Description
        AkRoundedContainer(
          padding: const EdgeInsets.all(AkSizes.md),
          borderRadius: BorderRadius.circular(AkSizes.borderRadiusMd),
          backgroundColor: isDarkMode ? AkColors.darkerGrey : AkColors.grey,
          child: Column(
            children: [
              // * Title, Price And Stock Status
              Row(
                children: [
                  const AkSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: AkSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const AkProductTitleText(
                              title: 'Price : ', smallSize: true),
                          // ? Actual Price
                          Text(
                            '\$30',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: AkSizes.spaceBtwItems),
                          // ? Sale Price
                          const AkProductPriceText(price: '20'),
                        ],
                      ),

                      // * Stock
                      Row(
                        children: [
                          const AkProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              // * Variation Description
              const AkProductTitleText(
                  title: '',
                  smallSize: true,
                  maxLines: 4),
            ],
          ),
        ),
        const SizedBox(height: AkSizes.spaceBtwItems),

        // * Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AkSectionHeading(title: 'Color', showActionButton: false),
            const SizedBox(height: AkSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                AkChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'Blue', selected: true, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        const SizedBox(height: AkSizes.spaceBtwItems / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AkSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: AkSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 6,
              runSpacing: 8,
              children: [
                AkChoiceChip(
                    text: 'EU 33', selected: true, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 34', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 35', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 36', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 37', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 38', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 39', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 40', selected: false, onSelected: (value) {}),
                AkChoiceChip(
                    text: 'EU 41', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}

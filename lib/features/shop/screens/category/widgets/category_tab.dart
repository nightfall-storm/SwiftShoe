import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/layouts/grid_layout.dart';
import 'package:shoes_store/common/widgets/products/product_cards/product_card_vertical.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AkCategoryTab extends StatelessWidget {
  const AkCategoryTab({
    super.key,
    required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(AkSizes.defaultSpace),
            child: Column(
              children: [
                // * Brands
                AkBrandShowcase(images: images),
                const SizedBox(height: AkSizes.spaceBtwItems),

                // * Products
                AkSectionHeading(title: 'Featured Brands', onPressed: () {}),
                const SizedBox(height: AkSizes.spaceBtwItems),

                AkGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const AkProductCardVertical(height: 150))
              ],
            ),
          ),
        ]);
  }
}

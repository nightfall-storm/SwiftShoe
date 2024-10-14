import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/layouts/grid_layout.dart';
import 'package:shoes_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoes_store/features/shop/models/collection_model.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AkCategoryTab extends StatelessWidget {
  const AkCategoryTab({
    super.key, required this.collection,
  });
  final CollectionModel collection;

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
                const AkBrandShowcase(images: [
                  AkImages.productImage1,
                  AkImages.productImage2,
                  AkImages.productImage3,
                ]),
                const SizedBox(height: AkSizes.spaceBtwItems),

                // * Products
                AkSectionHeading(title: 'Featured Brands', onPressed: () {}),
                const SizedBox(height: AkSizes.spaceBtwItems),

                AkGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) =>
                        const AkProductCardVertical(height: 150))
              ],
            ),
          ),
        ]);
  }
}

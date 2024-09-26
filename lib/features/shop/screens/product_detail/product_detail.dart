import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/Icon/circular_icon.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shoes_store/common/widgets/images/round_image.dart';
import 'package:shoes_store/utils/constants/colors.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import 'widgets/product_detail_image_slider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * Product Image Slider
            const AkProductImageSlider(),

            // * Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: AkSizes.defaultSpace,
                  left: AkSizes.defaultSpace,
                  bottom: AkSizes.defaultSpace),
              child: Column(
                children: [
                  // ? Rating & sharing
                  Row(
                    children: [
                      // ? Rating
                      Row(
                        children: [
                          const Icon(Iconsax.star5,
                              color: Colors.amber, size: 24),
                          const SizedBox(width: AkSizes.spaceBtwItems / 2),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: '5.0',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const TextSpan(text: '(199)'),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )

                  // ? Price, Title, Stock & Brand

                  // ? Attributes

                  // ? Checkout Button

                  // ? Description

                  // ? Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

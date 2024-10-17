import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/features/shop/controllers/product/product_controller.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../features/shop/screens/product_detail/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows_style.dart';
import '../../Icon/circular_icon.dart';
import '../../containers/rounded_container.dart';
import '../../images/round_image.dart';
import '../../texts/brand_title_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class AkProductCardVertical extends StatelessWidget {
  const AkProductCardVertical(
      {super.key,
      this.height = 180,
      this.width = 180,
      this.imageHeight = 180,
      required this.product});

  final double height;
  final double imageHeight;
  final double width;

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final isDarkMode = AkHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(
            product: product,
          )),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: isDarkMode ? null : [AkShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AkSizes.productImageRadius),
          color: isDarkMode ? AkColors.darkContainer : AkColors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                // * Thumbnail Image
                AkRoundedImage(
                  imageUrl: product.thumbnail,
                  height: imageHeight,
                  isNetworkImage: true,
                  backgroundColor: AkColors.lightContainer,
                ),
                // * Discount TAG
                Positioned(
                  width: 57,
                  top: 17,
                  left: 5,
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
                      child: Center(
                        child: Text(
                          '$salePercentage% OFF',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: AkColors.white),
                        ),
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
            Padding(
              padding: const EdgeInsets.only(left: AkSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AkProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: AkSizes.spaceBtwItems / 2),
                  AkBrandTitleWithVerifiedIcon(
                      title: product.brand != null
                          ? product.brand!.name
                          : 'Unknown Brand',
                      textAlign: TextAlign.start,
                      mainAxisSize: MainAxisSize.max),
                ],
              ),
            ),
            // ? Spacer to keep the height of each box same in case 1 or 2 heading lines
            const Spacer(),
            // ? Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // * Price
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: AkSizes.sm),
                          child: AkProductPriceText(
                            price: controller.getProductPrice(product),
                            isLarge: true,
                          ),
                        ),
                        if (product.productType ==
                                ProductType.single.toString() &&
                            product.salePrice > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: AkSizes.sm),
                            child: Text(
                              '${product.price}\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                          ),
                      ],
                    ),
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

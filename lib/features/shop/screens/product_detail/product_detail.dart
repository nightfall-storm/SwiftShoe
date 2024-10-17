import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shoes_store/features/shop/screens/cart/cart.dart';

import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';
import '../product_reviews/product_reviews.dart';
import 'widgets/bottom_product_to_cart.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share.dart';



class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const AkBottomAddToCart(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // * Product Image Slider
              AkProductImageSlider(product: product),
      
              // * Product Details
              Padding(
                padding: const EdgeInsets.only(
                    right: AkSizes.defaultSpace - 7,
                    left: AkSizes.defaultSpace - 10,
                    bottom: AkSizes.defaultSpace),
                child: Column(
                  children: [
                    // ? Rating & sharing
                    const AkRateAndShare(),
      
                    // ? Price, Title, Stock & Brand
                    const AkProductMetaData(),
      
                    // ? Attributes
                    const AkProductAttributes(),
                    const SizedBox(height: AkSizes.spaceBtwSections),
      
                    // ? Checkout Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const CartScreen(fromProductDetail: true,)),
                          child: const Text('Checkout')),
                    ),
                    const SizedBox(height: AkSizes.spaceBtwSections),
      
                    // ? Description
                    const AkSectionHeading(title: 'Description', showActionButton: false),
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    const ReadMoreText(
                      'Step into the future of comfort and performance with the Nike Air Zoom Runner in striking green. Engineered for athletes and trendsetters, this shoe features breathable mesh for ventilation and Zoom Air cushioning for unbeatable responsiveness. Perfect for everyday wear or intense workouts, the lightweight design offers flexibility while the durable outsole delivers excellent grip. Stand out in style with the bold green colorway, and experience the perfect blend of innovation, comfort, and iconic Nike design.',
                      trimLines: 4,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show More',
                      trimExpandedText: ' Less',
                      moreStyle: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),
      
                    // ? Reviews
                    const Divider(),
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AkSectionHeading(
                          title: 'Reviews(199)',
                          onPressed: () {},
                          showActionButton: false,
                        ),
                        IconButton(
                          onPressed: () => Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        )
                      ],
                    ),
                    const SizedBox(height: AkSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

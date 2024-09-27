import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/utils/device/device_utility.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/progress_indicator_rating.dart';
import 'widgets/rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * AppBar
      appBar: AkAppBar(
        title: 'Reviews & Ratings',
        onPressed: () => Get.back(),
        actions: const [],
      ),
      // * Body
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use.",
              ),
              SizedBox(
                height: AkSizes.spaceBtwItems,
              ),
              // * Overall Product Ratings
              AkOverallProductRating(),
              
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import 'widgets/rating_progress_indicator.dart';
import 'widgets/user_review_card.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use.",
              ),
              const SizedBox(
                height: AkSizes.spaceBtwItems,
              ),
              // * Overall Product Ratings
              const AkOverallProductRating(),
              const AkRatingBarIndicator(rating: 4.5),
              Text("9,337", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}


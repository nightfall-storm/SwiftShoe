import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shoes_store/common/widgets/containers/rounded_container.dart';
import 'package:shoes_store/common/widgets/products/ratings/rating_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(AkImages.userProfileImage1)),
                const SizedBox(width: AkSizes.spaceBtwItems),
                Text('Jessica Don',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: AkSizes.spaceBtwItems),

        // * Reviews
        const Row(
          children: [
            AkRatingBarIndicator(rating: 4),
            SizedBox(width: AkSizes.spaceBtwItems),
            Text('13 Oct, 2024'),
          ],
        ),
        const SizedBox(height: AkSizes.spaceBtwItems),
        const ReadMoreText(
          ' Great Performance and Style! \nI recently purchased the Nike Air Zoom Runner in green, and I’m really impressed with the comfort and performance they offer. The Zoom Air cushioning makes running feel almost effortless, and the lightweight design is perfect for both my workouts and casual wear. The green color really stands out, and I’ve received several compliments! \nThe only reason I’m giving it 4 stars instead of 5 is that the sizing runs a bit small, so I’d recommend going half a size up for the perfect fit. Other than that, they’re fantastic shoes, and I’d highly recommend them!\n',
          trimLines: 4,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AkColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AkColors.primary),
        ),
        const SizedBox(height: AkSizes.spaceBtwItems),
        // * Company Review
        AkRoundedContainer(
          borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
          backgroundColor: isDarkMode ? AkColors.darkContainer : AkColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(AkSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Swiftshoe",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('14 Oct, 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: AkSizes.spaceBtwItems),
                const ReadMoreText(
                  'Thank you so much for your thoughtful review! We’re thrilled to hear that you’re enjoying the comfort and performance of the Nike Air Zoom Runner. Your feedback about the sizing is valuable, and we appreciate you sharing that tip with other customers. We strive to provide the best products and your insights help us improve. If you have any further questions or need assistance, feel free to reach out. Happy running, and we hope to see you again soon!',
                  trimLines: 4,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AkColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AkColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AkSizes.spaceBtwSections),
      ],
    );
  }
}

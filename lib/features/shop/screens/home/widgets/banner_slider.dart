import 'package:carousel_slider_x/carousel_slider_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/round_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class AkBannerSlider extends StatelessWidget {
  const AkBannerSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: const CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: banners.map((url) => AkRoundedImage(imageUrl: url)).toList(),
          onPageChanged: (index, _) => controller.updatePageIndicator(index),
        ),
        const SizedBox(height: AkSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  AkCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? AkColors.darkerGrey
                              : AkColors.grey),
              ],
            ),
          ),
        )
      ],
    );
  }
}

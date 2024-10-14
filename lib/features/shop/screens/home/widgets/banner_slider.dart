import 'package:carousel_slider_x/carousel_slider_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/shimmer/shimmer.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/round_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class AkBannerSlider extends StatelessWidget {
  const AkBannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Obx(() {
      // loader
      if (controller.isLoading.value) {
        return const AkShimmerEffect(width: 300, height: 240);
      }

      // no data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: const CarouselOptions(
                height: 240,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlay: true,
              ),
              items: controller.banners
                  .map((banner) => AkRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            ),
            const SizedBox(height: AkSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      AkCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carouselCurrentIndex.value == i
                                ? isDarkMode
                                    ? AkColors.white
                                    : AkColors.darkerGrey
                                : isDarkMode
                                    ? AkColors.grey.withOpacity(0.5)
                                    : AkColors.grey,
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/Icon/circular_icon.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/round_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/images_controller.dart';
import '../../../models/product_model.dart';

class AkProductImageSlider extends StatelessWidget {
  const AkProductImageSlider({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return AkCurvedEdges(
        child: Container(
      color: isDarkMode ? AkColors.darkContainer : AkColors.light,
      child: Stack(
        children: [
          // ? Main Large Image
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(AkSizes.productImageRadius * 2),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnLargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: AkColors.primary,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            left: AkSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(
                  width: AkSizes.spaceBtwItems,
                ),
                itemCount: images.length,
                itemBuilder: (_, index) => Obx(() {
                  final imageSelected =
                      controller.selectedProductImage.value == images[index];
                  return AkRoundedImage(
                      isNetworkImage: true,
                      width: 80,
                      backgroundColor:
                          isDarkMode ? AkColors.dark : AkColors.white,
                      border: Border.all(
                          color: imageSelected
                              ? AkColors.primary
                              : Colors.transparent),
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      padding: const EdgeInsets.all(AkSizes.sm),
                      imageUrl: images[index]);
                }),
              ),
            ),
          ),
          AkAppBar(
            onPressed: () => Get.back(),
            actions: const [
              Padding(
                  padding: EdgeInsets.only(right: AkSizes.md),
                  child: AkCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    ));
  }
}

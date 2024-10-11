import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/shop/controllers/brand_controller.dart';

import '../../../features/shop/screens/brand/brand_products.dart';
import '../image_text_widgets/vertical_image_text.dart';
import '../../../utils/constants/image_strings.dart';
import '../shimmer/brand_shimmer.dart';

class AkBrandsHorizontal extends StatelessWidget {
  const AkBrandsHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());



    return Obx(
      (){
      if(brandController.isLoading.value) return const AkBrandShimmer();
      return SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return AkVerticalImageText(
              title: 'Nike',
              image: AkImages.nikeLogo,
              backgroundColor: null,
              onTap: () => Get.to(() => const BrandProducts()),
            );
          },
        ),
      );
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/shop/controllers/brand_controller.dart';

import '../../../features/shop/screens/brand/brand_products.dart';
import '../image_text_widgets/vertical_image_text.dart';
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

      if(brandController.featuredBrands.isEmpty){
        return Center(child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
      return SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: brandController.featuredBrands.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final brand = brandController.featuredBrands[index];
            return AkVerticalImageText(title: brand.name, image: brand.image, onTap: () => Get.to(() => const BrandProducts()),
            );
          },
        ),
      );
      }
    );
  }
}

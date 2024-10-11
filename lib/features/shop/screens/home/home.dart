import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/navigation_helper.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../all_products/all_products.dart';
import '../brand/all_brand.dart';
import 'widgets/banner_slider.dart';
import '../../../../common/widgets/containers/brands_horizontal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(UserController());
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        handleBackNavigation(); // Call the reusable back navigation function
        return false; // Prevent the default pop behavior
      },
      child: Scaffold(
        // * Reusable AppBar
        appBar: const AkAppBar(
          showBackArrow: false,
          isHomeScreen: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // * SearchBar
              const AkSearchContainer(text: 'Search in Store'),
              // * SliderBanner
              const Padding(
                padding: EdgeInsets.zero,
                child: AkBannerSlider(
                  banners: [
                    AkImages.homeBanner1,
                    AkImages.homeBanner2,
                    AkImages.homeBanner3,
                  ],
                ),
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),
              // * Brands
              Padding(
                padding: const EdgeInsets.only(
                    left: AkSizes.defaultSpace / 2,
                    right: AkSizes.defaultSpace / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ? Heading
                    AkSectionHeading(
                      title: 'Top Brands',
                      showActionButton: true,
                      onPressed: () => Get.to(() => const AllBrandsScreen()),
                    ),
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    // ? Brands Section
                    const AkBrandsHorizontal(),
                    // ? Heading Popular Products
                    AkSectionHeading(
                      title: 'Popular Products',
                      showActionButton: true,
                      onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    AkGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const AkProductCardVertical(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

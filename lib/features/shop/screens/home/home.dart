import 'package:flutter/material.dart';

import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/navigation_helper.dart';
import 'widgets/banner_slider.dart';
import '../../../../common/widgets/containers/categories_horizontal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              // * Categories
              Padding(
                padding: const EdgeInsets.only(
                    left: AkSizes.defaultSpace / 2,
                    right: AkSizes.defaultSpace / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ? Heading
                    const AkSectionHeading(
                      title: 'Top Brands',
                      showActionButton: false,
                    ),
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    // ? Categories Section
                    const AkCategoriesHorizontal(),

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

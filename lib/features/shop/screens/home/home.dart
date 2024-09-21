// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../utils/constants/image_strings.dart';
import 'widgets/banner_slider.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * Reusable AppBar
      appBar: const AkAppBar(
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
              padding: const EdgeInsets.only(left: AkSizes.defaultSpace / 2, right: AkSizes.defaultSpace / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ? Heading
                  const AkSectionHeading(
                      title: 'Top Brands', showActionButton: false),
                  const SizedBox(height: AkSizes.spaceBtwItems),
                  // ? Categories Section
                  const AkHomeCategories(),

                  AkGridLayout(itemCount: 2, itemBuilder: (_, index) => const AkProductCardVertical()),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shoes_store/features/shop/controllers/home_controller.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

import '../../../../common/widgets/images/round_images.dart';
import '../../../../common/widgets/containers/seaction_cotainer.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../utils/constants/colors.dart';
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
            const Padding(
              padding: EdgeInsets.only(left: AkSizes.defaultSpace / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ? Heading
                  AkSectionHeading(
                      title: 'Top Brands', showActionButton: false),
                  SizedBox(height: AkSizes.spaceBtwItems),
                  // ? Categories Section
                  AkHomeCategories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

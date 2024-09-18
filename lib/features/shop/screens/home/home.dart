// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

import '../../../../common/widgets/containers/header_container.dart';
import '../../../../common/widgets/containers/seaction_cotainer.dart';
import '../../../../common/widgets/containers/search_container.dart';
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
            // * Header HomeBanner
            const AkHeaderContainer(),
            const SizedBox(height: AkSizes.spaceBtwSections),
            // * Categories
            Padding(
              padding: EdgeInsets.only(left: AkSizes.defaultSpace / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ? Heading
                  const AkSectionHeading(
                      title: 'Top Brands', showActionButton: false),
                  const SizedBox(height: AkSizes.spaceBtwItems),
                  // ? Categories Section
                  const AkHomeCategories(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


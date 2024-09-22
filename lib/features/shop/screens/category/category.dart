// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/containers/rounded_container.dart';
import 'package:shoes_store/common/widgets/layouts/grid_layout.dart';
import 'package:shoes_store/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shoes_store/utils/constants/enums.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AkAppBar(
        showBackArrow: true,
        title: 'Category',
        onPressed: () => Get.back(),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: AkHelperFunctions.isDarkMode(context)
                    ? AkColors.black
                    : AkColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 24),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      AkSectionHeading(
                          title: 'Featured Brands', onPressed: () {}),
                      const SizedBox(height: AkSizes.spaceBtwItems / 1.5),
                      // * GridView for brands cards

                      AkGridLayout(
                          mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: AkRoundedContainer(
                                padding: EdgeInsets.all(AkSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                    AkSizes.borderRadiusLg),
                                child: Row(
                                  children: [
                                    // * Icon
                                    Flexible(
                                        child: AkCircularImage(
                                            image: AkImages.nikeLogo)),
                                    const SizedBox(
                                        height: AkSizes.spaceBtwItems),
                                    // * Text

                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AkBrandTitleWithVerifiedIcon(
                                              title: 'Nike',
                                              brandTextSize: TextSizes.large),
                                          Text('256 products',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}

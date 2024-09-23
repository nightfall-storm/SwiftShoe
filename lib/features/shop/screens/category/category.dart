// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/containers/rounded_container.dart';
import 'package:shoes_store/common/widgets/layouts/grid_layout.dart';
import 'package:shoes_store/common/widgets/texts/brand_title_verified_icon.dart';
import 'package:shoes_store/utils/constants/enums.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import 'widgets/category_tab.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AkAppBar(showBackArrow: true, title: 'Category'),
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
                              return AkBrandCard(showBorder: true);
                            }),
                      ],
                    ),
                  ),
                  // * Tabs
                  bottom: AkTabBar(
                    tabs: const [
                      Tab(child: Text('Men')),
                      Tab(child: Text('Women')),
                      Tab(child: Text('Kids')),
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Formal')),
                      Tab(child: Text('Casual')),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(children: const [
              AkCategoryTab(
                images: [
                  AkImages.productImage2,
                  AkImages.productImage3,
                  AkImages.productImage4
                ],
              ),
              AkCategoryTab(
                images: [
                  AkImages.productImage11,
                  AkImages.productImage10,
                  AkImages.productImage9,
                ],
              ),
              AkCategoryTab(images: [
                AkImages.productImage5,
                AkImages.productImage6,
                AkImages.productImage7
              ]),
              AkCategoryTab(images: [
                AkImages.productImage2,
                AkImages.productImage8,
                AkImages.productImage9
              ]),
              AkCategoryTab(images: [
                AkImages.productImage2,
                AkImages.productImage3,
                AkImages.productImage4
              ]),
              AkCategoryTab(images: [
                AkImages.productImage1,
                AkImages.productImage11,
                AkImages.productImage7
              ]), 
            ],
            
          )),
      ),
    );
  }
}

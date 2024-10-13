// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/layouts/grid_layout.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/navigation_helper.dart';
import '../../controllers/collection_controller.dart';
import 'widgets/category_tab.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionController controller = Get.put(CollectionController());

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        handleBackNavigation(); // Call the reusable back navigation function
        return false; // Prevent the default pop behavior
      },
      child: Obx(() {
        if (controller.isLoading.value) {
          return Scaffold(
            appBar: AkAppBar(title: 'Category'),
            body:
                Center(child: CircularProgressIndicator()), // Loading indicator
          );
        }

        if (controller.allCollections.isEmpty) {
          return Scaffold(
            appBar: AkAppBar(title: 'Category'),
            body: Center(
                child:
                    Text('No collections available.')), // Message for no data
          );
        }

        final tabCount = controller.allCollections.length;

        return DefaultTabController(
          length: tabCount,
          child: Scaffold(
            appBar: AkAppBar(title: 'Category'),
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
                          AkGridLayout(
                            mainAxisExtent: 80,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return AkBrandCard(showBorder: true);
                            },
                          ),
                        ],
                      ),
                    ),
                    bottom: AkTabBar(controller: controller),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  ...controller.allCollections.map((collection) {
                    return AkCategoryTab(
                      images: const [
                        // Replace with the actual images related to the collection
                        AkImages.productImage1,
                        AkImages.productImage2,
                        AkImages.productImage3,
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

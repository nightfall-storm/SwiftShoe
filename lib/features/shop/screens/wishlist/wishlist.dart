import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/layouts/grid_layout.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/navigation_helper.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        handleBackNavigation(); // Call the reusable back navigation function
        return false; // Prevent the default pop behavior
      },
      child: Scaffold(
        appBar: const AkAppBar(
          isWishListScreen: true,
          title: 'WishList',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AkSizes.defaultSpace),
            child: Column(
              children: [
                AkGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const AkProductCardVertical())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

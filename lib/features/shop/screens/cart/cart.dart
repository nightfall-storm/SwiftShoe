import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';

import '../../../../common/widgets/texts/product_price_text.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/navigation_helper.dart';
import 'widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.fromProductDetail = false});

  final bool fromProductDetail;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (fromProductDetail) return true;
        handleBackNavigation(); // Call the reusable back navigation function
        return false;
      },
      child: Scaffold(
        appBar: AkAppBar(
            title: 'Cart',
            onPressed: () {
              if (fromProductDetail) return Get.back();
              handleBackNavigation();
            },
            actions: const [],
            appBarSize: 35),
        body: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: AkSizes.spaceBtwSections),
              itemBuilder: (_, index) => const Column(
                    children: [
                      AkCartItem(),
                      SizedBox(height: AkSizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 70),
                              // * Add Remove Buttons
                              AkProductQuantityWithAddRemove(),
                            ],
                          ),
                          // * Product total price
                          AkProductPriceText(price: '256'),
                        ],
                      )
                    ],
                  )),
        ),
        bottomNavigationBar: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout \$256.0')),
      ),
    );
  }
}

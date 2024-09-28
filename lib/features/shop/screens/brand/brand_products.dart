import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * AppBar
      appBar: AkAppBar(
        title: 'Nike',
        onPressed: () => Get.back(),
        actions: const [],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            children: [
              // * Brand Detail
              AkBrandCard(showBorder: true),
              SizedBox(height: AkSizes.spaceBtwSections),
              AkSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AkAppBar(
          title: 'Popular Products',
          onPressed: () => Get.back(),
          actions: const []),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AkSizes.defaultSpace),
          child: AkSortableProducts(),
        ),
      ),
    );
  }
}


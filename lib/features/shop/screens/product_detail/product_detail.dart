// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/Icon/circular_icon.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shoes_store/common/widgets/images/round_image.dart';
import 'package:shoes_store/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:shoes_store/utils/constants/colors.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * Product Image Slider
            const AkProductImageSlider(),

            // * Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: AkSizes.defaultSpace,
                  left: AkSizes.defaultSpace,
                  bottom: AkSizes.defaultSpace),
              child: Column(
                children: [
                  // ? Rating & sharing
                  AkRateAndShare(),

                  // ? Price, Title, Stock & Brand
                  AkProductMetaData(),

                  // ? Attributes


                  // ? Checkout Button


                  // ? Description


                  // ? Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


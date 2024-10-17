import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  // Variables
  RxString selectedProductImage = ''.obs;

  // Helper method to normalize Firebase Storage URLs
  String _normalizeImageUrl(String url) {
    // Extract the path without the token
    return url.split('?').first;
  }

  // Helper method to check if URL is already in the list
  bool _containsImage(List<String> images, String newImage) {
    String normalizedNew = _normalizeImageUrl(newImage);
    return images
        .any((existing) => _normalizeImageUrl(existing) == normalizedNew);
  }

  // Get All Images from product and Variations
  List<String> getAllProductImages(ProductModel product) {
    List<String> images = [];

    // 1. Handle thumbnail
    if (product.thumbnail.isNotEmpty) {
      images.add(product.thumbnail);
      selectedProductImage.value = product.thumbnail;
    }

    // 2. Handle product images
    if (product.images != null && product.images!.isNotEmpty) {
      for (var image in product.images!) {
        if (image.isNotEmpty && !_containsImage(images, image)) {
          images.add(image);
        }
      }
    }

    // 3. Handle variation images
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      for (var variation in product.productVariations!) {
        if (variation.image.isNotEmpty &&
            !_containsImage(images, variation.image)) {
          images.add(variation.image);
        }
      }
    }

    return images;
  }

  // Show Image Popup
  void showEnLargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AkSizes.defaultSpace * 2,
                horizontal: AkSizes.defaultSpace,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: AkSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

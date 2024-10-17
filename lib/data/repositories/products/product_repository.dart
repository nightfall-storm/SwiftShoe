import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shoes_store/data/services/firebase_storage_service.dart';
import 'package:shoes_store/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_store/utils/exceptions/platform_exceptions.dart';
import 'package:shoes_store/utils/popups/loaders.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  // static final Logger _logger = Logger();

  // Firestore instance for dataase interactions
  final _db = FirebaseFirestore.instance;

  // Get Limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      // _logger.i("Fetched documents: ${snapshot.docs.length}"); // Debug statement

      return snapshot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [ProductModel.empty()];
    }
  }

  // Upload Dummy Data
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all products along with their images
      final storage = Get.put(AkFirebaseStorageService());

      // Loop through Products
      for (var product in products) {
        // Get image and get its url
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attriute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get Image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // assign its URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        // Upload Variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get Image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload Image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // Assign Url to variation.image attribute
            variation.image = url;
          }
        }

        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

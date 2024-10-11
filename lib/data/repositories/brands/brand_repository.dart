import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_store/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../services/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // * Variables
  final _db = FirebaseFirestore.instance;

  // * Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final list = snapshot.docs
          .map((document) => BrandModel.fromSnapShot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  // * Upload Brands to the Cloud Firebase
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      // Upload all the brands along with their images
      final storage = Get.put(AkFirebaseStorageService());

      for (var brand in brands) {
        try {
          print('Uploading brand: ${brand.name}');

          // Get ImageData link from the local assets
          final file = await storage.getImageDataFromAssets(brand.image);
          print('Image data retrieved for ${brand.name}');

          // Upload Image and Get its URL
          final url = await storage.uploadImageData('Brands', file, brand.name);
          print('Image uploaded for ${brand.name}');

          // Assign URL to Brand.image attribute
          brand.image = url;

          // Store Brand in Firestore
          await _db.collection("Brands").doc(brand.id).set(brand.toJson());
          print('Brand data uploaded to Firestore for ${brand.name}');
        } catch (e) {
          print('Error uploading brand ${brand.name}: $e');
        }
      }
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}

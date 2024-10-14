import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/shop/models/banner_model.dart';
import 'package:shoes_store/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_store/utils/exceptions/format_exceptions.dart';
import 'package:shoes_store/utils/exceptions/platform_exceptions.dart';

import '../../../utils/popups/loaders.dart';
import '../../services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AkFormatException();
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching banners. $e';
    }
  }

  // Upload Banners to Firebase Storage and Firestore
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      final storage = Get.put(AkFirebaseStorageService());

      for (var banner in banners) {
        try {
          // Get image data from local assets
          final file = await storage.getImageDataFromAssets(banner.imageUrl);

          // Upload image and get its URL
          final url = await storage.uploadImageData('Banners', file, banner.imageUrl.split('/').last);

          // Assign URL to banner.imageUrl attribute
          banner.imageUrl = url;

          // Store banner in Firestore
          await _db.collection("Banners").add(banner.toJson()); // Use .add() for auto-generated ID
        } catch (e) {
          AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
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

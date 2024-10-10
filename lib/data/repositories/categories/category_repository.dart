import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_store/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/shop/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // * Variables
  final _db = FirebaseFirestore.instance;

  // * Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapShot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }
}

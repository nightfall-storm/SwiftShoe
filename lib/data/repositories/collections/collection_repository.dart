import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shoes_store/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/shop/models/collection_model.dart';

class CollectionRepository extends GetxController {
  static CollectionRepository get instance => Get.find();

  // * Variables
  final _db = FirebaseFirestore.instance;

  // * Get all collections
  Future<List<CollectionModel>> getAllCollections() async {
    try {
      final snapshot = await _db.collection('Collections').get();
      final list = snapshot.docs
          .map((document) => CollectionModel.fromSnapShot(document))
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

  // * Upload Collections to Cloud Firebase (without image handling)
  Future<void> uploadDummyData(List<CollectionModel> collections) async {
    try {
      for (var collection in collections) {
        // Store collection in Firestore
        await _db
            .collection("Collections")
            .doc(collection.id)
            .set(collection.toJson());
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

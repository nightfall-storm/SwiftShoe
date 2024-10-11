import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AkFirebaseStorageService extends GetxController{
  static AkFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  // Upload Local Asset from IDE
  // Returns a Uint8List containing image data
  Future<Uint8List> getImageDataFromAssets(String path) async{
  try{
    final byteData = await rootBundle.load(path);
    final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return imageData;
  } catch (e){
    throw 'Error loading image data : $e';
  }
  }

  // Upload Image using ImageData on CLoud Firebase Storage
  // Returns the download URL of the uploaded image.
  Future<String> uploadImageData(String path, Uint8List image, String name) async{
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Error Uploading image: $e';
    }
  }

}
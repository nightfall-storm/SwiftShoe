import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  // * Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  // * Convert model to Json Structure to store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  // * Map Json oriented document snapshot from firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    // Map JSON Record to the MODEL
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }

  // * Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the MODEL
      return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        productsCount: data['ProductsCount'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return BrandModel.empty();
    }
  }
}

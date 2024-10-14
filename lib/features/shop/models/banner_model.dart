import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  bool active;
  String imageUrl;
  String targetScreen;

  BannerModel({
    required this.active,
    required this.imageUrl,
    required this.targetScreen,
  });

  // * Empty Helper Function
  static BannerModel empty() =>
      BannerModel(active: false, imageUrl: '', targetScreen: '');

  // * Convert model to Json Structure to store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
        active: data['Active'],
        imageUrl: data['ImageUrl'],
        targetScreen: data['TargetScreen']);
  }
}

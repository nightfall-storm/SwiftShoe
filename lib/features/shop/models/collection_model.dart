import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionModel {
  String id;
  String name;
  String parentId;
  bool isFeatured;

  CollectionModel({
    required this.id,
    required this.name,
    required this.isFeatured,
    this.parentId = '',
  });

  // * Empty Helper Function
  static CollectionModel empty() => CollectionModel(id: '', name: '', isFeatured: false);

  // * Convert model to Json Structure to store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  // * Map Json oriented document snapshot from Firebase to UserModel
  factory CollectionModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the MODEL
      return CollectionModel(
        id: document.id,
        name: data['Name'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CollectionModel.empty();
    }
  }
}

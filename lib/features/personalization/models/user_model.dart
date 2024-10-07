import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String username;
  final String email;
  String phoneNumber;
  String profilePicture;
  String gender; 
  String birthday; 

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.gender,
    required this.birthday,
  });

  String get formattedPhoneNumber => AkFormatter.formatPhoneNumber(phoneNumber);

  static String generateUsername(String username) {
    String camelCaseUsername = username.toLowerCase(); // Convert to lowercase
    String usernameWithPrefix = "ak_$camelCaseUsername"; // Add "ak_" prefix
    return usernameWithPrefix;
  }

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
      id: "",
      username: "",
      email: "",
      phoneNumber: "",
      profilePicture: "",
      gender: "",
      birthday: "");

  // Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Gender': gender,
      'Birthday': birthday,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      username: data['Username'] ?? "",
      email: data['Email'] ?? "",
      phoneNumber: data['PhoneNumber'] ?? "",
      profilePicture: data['ProfilePicture'] ?? "",
      gender: data['Gender'] ?? "", 
      birthday: data['Birthday'] ?? "", 
    );
  }
}

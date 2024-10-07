import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/personalization/controllers/user_controller.dart';
import 'package:shoes_store/features/personalization/screens/profile/profile.dart';
import 'package:shoes_store/utils/helpers/network_manager.dart';
import 'package:shoes_store/utils/popups/full_screen_loader.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/loaders.dart';

class UpdateGenderController extends GetxController {
  static UpdateGenderController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  // Observable variable to hold the selected gender
  var selectedGender = ''.obs;

  // * Init user data when home screen appears
  @override
  void onInit() {
    initializeGender();
    super.onInit();
  }

  // * Fetch User record
  Future<void> initializeGender() async {
    selectedGender.value = userController.user.value.gender;
  }

  Future<void> updateUserGender() async {
    try {
      // Form Validation
      if (selectedGender.value.isEmpty) {
        AkLoaders.warningSnackBar(
          title: 'Select Gender',
          message: 'Please select your gender before proceeding.',
        );
        return;
      }

      // Start loading
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(milliseconds: 300));
        AkFullScreenLoader.openLoadingDialog(
          'We are updating your information...',
          AkImages.docerAnimation,
        );
      });

      // Check Network Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AkFullScreenLoader.stopLoading();
        AkLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection',
        );
        return;
      }

      // Update user's gender in the Firebase Firestore
      Map<String, dynamic> gender = {'Gender': selectedGender.value.trim()};
      await userRepository.updateSingleField(gender);

      // Update the Rx user value
      userController.user.value.gender = selectedGender.value.trim();

      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2000));

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Show Success Message
      AkLoaders.successSnackBar(
        title: 'Awesome!',
        message: 'Your gender has been updated.',
      );

      // Move to previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      AkFullScreenLoader.stopLoading();
      // Add a delay before removing the loader in case of an error
      await Future.delayed(const Duration(milliseconds: 2300));
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

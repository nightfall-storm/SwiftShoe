import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/personalization/controllers/user_controller.dart';
import 'package:shoes_store/features/personalization/screens/profile/profile.dart';
import 'package:shoes_store/utils/helpers/network_manager.dart';
import 'package:shoes_store/utils/popups/full_screen_loader.dart';

import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/loaders.dart';

class UpdateBirthdayController extends GetxController {
  static UpdateBirthdayController get instance => Get.find();

  final userBirthday = ''.obs; // Make it observable
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  // * init user data when home screen appears
  @override
  void onInit() {
    initializeBirthday();
    super.onInit();
  }

  // * Fetch User record
  Future<void> initializeBirthday() async {
    userBirthday.value = userController.user.value.birthday;
  }

  Future<void> updateUserBirthday() async {
    try {
      // Start loading
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(milliseconds: 300));
        AkFullScreenLoader.openLoadingDialog(
            'We are updating your information...', AkImages.docerAnimation);
      });

      // Check Network Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AkFullScreenLoader.stopLoading();
        AkLoaders.errorSnackBar(
            title: 'No Internet',
            message: 'Please check your internet connection');
        return;
      }

      // Update user's birthday in the Firebase Firestore
      Map<String, dynamic> birthday = {'Birthday': userBirthday.value.trim()};
      await userRepository.updateSingleField(birthday);

      // Update the Rx user value
      userController.user.value.birthday = userBirthday.value.trim();

      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2000));

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Show Success Message
      AkLoaders.successSnackBar(
          title: 'Awesome!', message: 'Your Birthday has been updated.');

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/personalization/controllers/user_controller.dart';
import 'package:shoes_store/features/personalization/screens/profile/profile.dart';
import 'package:shoes_store/utils/helpers/network_manager.dart';
import 'package:shoes_store/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final userName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // * init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // * Fetch User record
  Future<void> initializeNames() async {
    userName.text = userController.user.value.username;
  }

  Future<void> updateUserName() async {
    try {
      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        return;
      }

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

      // Update user's username in the Firebase Firestore
      Map<String, dynamic> name = {'Username': userName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.username = userName.text.trim();

      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2000));

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Show Success Message
      AkLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated.');

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

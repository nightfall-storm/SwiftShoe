import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/utils/popups/full_screen_loader.dart';
import 'package:shoes_store/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // * Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final name = TextEditingController(); // controller for the name input
  final email = TextEditingController(); // controller for the email input
  final phoneNumber = TextEditingController(); // controller for the phone number input
  final password = TextEditingController(); // controller for the password input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Formkey for validation
  // * Signup
  Future<void> signup() async {
    try {
      // * Start loading
      AkFullScreenLoader.openLoadingDialog('We are processing your information...', AkImages.dockerAnimation);

      // * Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // * form validation
      if(!signupFormKey.currentState!.validate()) return;

    } catch (e) {
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      AkFullScreenLoader.stopLoading();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  // * Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // * Send Reset Password Email
  sendPasswordResetEmail() async{
    try {

      // start loading
      AkFullScreenLoader.openLoadingDialog('Processing your request...', AkImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AkFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()){
        AkFullScreenLoader.stopLoading();
        return;
      }

      // Send Email Request to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Show Success Screen
      AkLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent, Please Check Your Spam inbox');

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));

    } catch (e) {
      AkFullScreenLoader.stopLoading();
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // * Resend Reset Email Request
  resendPasswordResetEmail(String email) async{
     try {
      // start loading
      AkFullScreenLoader.openLoadingDialog('Processing your request...', AkImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AkFullScreenLoader.stopLoading();
        return;
      }

      // Send Email Request to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Show Success Screen
      AkLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent, Please Check Your Spam inbox');

    } catch (e) {
      AkFullScreenLoader.stopLoading();
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
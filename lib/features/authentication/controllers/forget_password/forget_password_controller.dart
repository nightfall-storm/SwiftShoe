import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // * Variables
  final email = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // * Handle back navigation
  Future<void> handleBackNavigation() async {
    if (emailFocusNode.hasFocus) {
      emailFocusNode.unfocus();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  // * Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        return;
      }

      // Ensure keyboard is dismissed
      emailFocusNode.unfocus();

      // Start loading after ensuring keyboard is dismissed
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(milliseconds: 300));
        AkFullScreenLoader.openLoadingDialog(
            'Processing your request...', AkImages.docerAnimation);
      });

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AkFullScreenLoader.stopLoading();
        AkLoaders.errorSnackBar(
            title: 'No Internet',
            message: 'Please check your internet connection');
        return;
      }

      // Send Email Request to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2000));

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Show Success Screen
      AkLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'If the email is registered, you will receive a link to reset your password. Please check your spam inbox.',
      );

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      // Add a delay before removing the loader in case of an error
      await Future.delayed(const Duration(milliseconds: 2300));
      AkFullScreenLoader.stopLoading();
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // * Resend Reset Email Request
  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      AkFullScreenLoader.openLoadingDialog(
          'Processing your request...', AkImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AkFullScreenLoader.stopLoading();
        return;
      }

      // Send Email Request to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2000));

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Show Success Screen
      AkLoaders.successSnackBar(
        title: 'Email Sent',
        message:
            'If the email is registered, you will receive a link to reset your password. Please check your spam inbox.',
      );
    } catch (e) {
      // Add a delay before removing the loader in case of an error
      await Future.delayed(const Duration(milliseconds: 2300));
      AkFullScreenLoader.stopLoading();
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

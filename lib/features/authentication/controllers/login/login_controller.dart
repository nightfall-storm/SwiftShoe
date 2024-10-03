import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  // * Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  // * Handle back navigation
  Future<void> handleBackNavigation() async {
    if (emailFocusNode.hasFocus || passwordFocusNode.hasFocus) {
      emailFocusNode.unfocus();
      passwordFocusNode.unfocus();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  // * Email and password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Validate the form first
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // Ensure keyboard is dismissed
      emailFocusNode.unfocus();
      passwordFocusNode.unfocus();

      // Start loading after ensuring keyboard is dismissed
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AkFullScreenLoader.openLoadingDialog(
            'Logging you in...', AkImages.dockerAnimation);
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

      /// Save Data if Remember Me is Selected
      // if (rememberMe.value) {
      //   localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
      //   localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      // }

      // If login is successful and remember me is checked, save the login state
      if (rememberMe.value) {
        localStorage.write('IS_LOGGED_IN', true);
      }

      // Login user using Email & password Authentication
      // ignore: unused_local_variable
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AkFullScreenLoader.stopLoading();
      AkLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Password or email is incorrect');
    }
  }
}

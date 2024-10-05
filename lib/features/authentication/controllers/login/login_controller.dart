import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_store/features/personalization/controllers/user_controller.dart';

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
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    // Re-initialize FocusNodes
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.onInit();
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
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // Ensure keyboard is dismissed
      emailFocusNode.unfocus();
      passwordFocusNode.unfocus();

      // Start loading after ensuring keyboard is dismissed
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(milliseconds: 300));
        AkFullScreenLoader.openLoadingDialog(
            'Logging you in...', AkImages.docerAnimation);
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

      // Attempt to login the user using Email & password Authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // If login is successful
      if (userCredential.user != null) {
        // Manage local storage based on "Remember Me"
        if (rememberMe.value) {
          localStorage.write('IS_REMEMBER_ME', true);
          // Optionally save user email for auto-fill
          localStorage.write('USER_EMAIL', email.text.trim());
        } else {
          localStorage.remove('IS_REMEMBER_ME');
          localStorage.remove('USER_EMAIL');
        }
      }
      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2000));

      // Remove Loader
      AkFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Add a delay before removing the loader in case of an error
      await Future.delayed(const Duration(milliseconds: 2300));
      AkFullScreenLoader.stopLoading();
      AkLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Password or email is incorrect');
    }
  }

  // * Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      AkFullScreenLoader.openLoadingDialog(
          'Logging you in...', AkImages.docerAnimation);

      // Check Network Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AkFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      // ignore: unused_local_variable
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      AkFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AkFullScreenLoader.stopLoading();
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

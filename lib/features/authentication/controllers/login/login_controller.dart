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
      // Validate the form first
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
  Future<void> googleSignIn() async{
    try {
      // Start Loading
      AkFullScreenLoader.openLoadingDialog('Logging you in...', AkImages.docerAnimation);

      // Check Network Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AkFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      // ignore: unused_local_variable
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

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

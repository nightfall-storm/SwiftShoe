import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // * Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = false.obs; // Observable for privacy policy acceptance
  final username = TextEditingController(); // controller for the Username input
  final email = TextEditingController(); // controller for the email input
  final phoneNumber = TextEditingController(); // controller for the phone number input
  final password = TextEditingController(); // controller for the password input
  final usernameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Formkey for validation

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  // * Handle back navigation
  Future<bool> handleBackNavigation() async {
    if (usernameFocusNode.hasFocus || emailFocusNode.hasFocus || 
        phoneFocusNode.hasFocus || passwordFocusNode.hasFocus) {
      usernameFocusNode.unfocus();
      emailFocusNode.unfocus();
      phoneFocusNode.unfocus();
      passwordFocusNode.unfocus();
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return true;
  }

  // * Signup
  void signup() async {
    try {
      // Ensure keyboard is dismissed
      await handleBackNavigation();

      // * form validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // * Privacy Policy Check
      if (!privacyPolicy.value) {
        AkLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create your account, you must read and accept the Privacy Policy & Terms of use',
        );
        return;
      }

      // * Start loading
      AkFullScreenLoader.openLoadingDialog(
          'We are processing your information...', AkImages.docerAnimation);

      // * Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AkFullScreenLoader.stopLoading();
        return;
      }



      // * Register user in Firebase authentication & Save user data
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // * Save Authenticated user data in the Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // * Remove loader
      AkFullScreenLoader.stopLoading();

      // * show Success Message
      AkLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify Email to continue.',
      );

      // * Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      AkFullScreenLoader.stopLoading();
      // Show some generic Error to the user
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

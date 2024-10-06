import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/data/repositories/authentication/authentication_repository.dart';
import 'package:shoes_store/data/repositories/user/user_repository.dart';
import 'package:shoes_store/features/authentication/screens/login/login.dart';
import 'package:shoes_store/utils/helpers/network_manager.dart';
import 'package:shoes_store/utils/popups/full_screen_loader.dart';
import 'package:shoes_store/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../models/user_model.dart';
import '../screens/profile/widgets/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // * Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update Rx User and the check if user data is already stored, If not store new data
      await fetchUserRecord();
      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save User Data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      AkLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile',
      );
    }
  }

  // * Delete User Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(AkSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently?, This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: AkSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  // * Delete User Account
  void deleteUserAccount() async {
    try {
      // Start loading
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.delayed(const Duration(milliseconds: 300));
        AkFullScreenLoader.openLoadingDialog(
            'We are updating your information...', AkImages.docerAnimation);
      });

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          // Add a delay before removing the loader
          await Future.delayed(const Duration(milliseconds: 2500));
          AkFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          // Add a delay before removing the loader
          await Future.delayed(const Duration(milliseconds: 2500));
          AkFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2800));
      AkFullScreenLoader.stopLoading();
      AkLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // * Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      if (!reAuthFormKey.currentState!.validate()) {
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

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2500));
      AkFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Add a delay before removing the loader
      await Future.delayed(const Duration(milliseconds: 2800));
      AkFullScreenLoader.stopLoading();
      AkLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/success_screen/success_screen.dart';
import 'package:shoes_store/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // * Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // * Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      AkLoaders.errorSnackBar(
        title: 'Verification Email Sent',
        message: 'Please check your inbox for the verification link.',
      );
    } catch (e) {
      AkLoaders.errorSnackBar(
        title: 'Verification Failed',
        message: 'Failed to send verification email: ${e.toString()}',
      );
    }
  }

  // * Set Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
              subTitle: AkTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
              image: AkImages.successfullyRegisterAnimation,
              title: AkTexts.yourAccountCreatedTitle));
        }
      },
    );
  }

  // * Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            subTitle: AkTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            image: AkImages.successfullyRegisterAnimation,
            title: AkTexts.yourAccountCreatedTitle),
      );
    }
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  Timer? _timer;

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
      AkLoaders.successSnackBar(
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

  // * Handle redirection to success screen
  void redirectToSuccessScreen() {
    Get.off(() => SuccessScreen(
          subTitle: AkTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          image: AkImages.successfullyRegisterAnimation,
          title: AkTexts.yourAccountCreatedTitle,
        ));
  }

  // * Set Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          redirectToSuccessScreen();
        }
      },
    );
  }

  // * Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      redirectToSuccessScreen();
    }
  }

  // * Cancel the timer when the controller is disposed of
  @override
  void onClose() {
    _timer?.cancel(); // Cancel the timer if it's active
    super.onClose();
  }
}

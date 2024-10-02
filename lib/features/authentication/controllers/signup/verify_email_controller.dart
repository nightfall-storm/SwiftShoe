import 'package:get/get.dart';
import 'package:shoes_store/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // * Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
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

  // * Manually check if email verified
}

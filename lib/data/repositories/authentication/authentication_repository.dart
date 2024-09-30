import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_store/features/authentication/screens/login/login.dart';
import 'package:shoes_store/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // * Variables
  final deviceStorage = GetStorage();

  // * Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // * Function to Show Relevant Screen
  screenRedirect() async {

    deviceStorage.writeIfNull('isFirstTime', true);

    bool isFirstTime = deviceStorage.read('isFirstTime');
    if (isFirstTime == false) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const OnBoaridngScreen());
    }
  }
}

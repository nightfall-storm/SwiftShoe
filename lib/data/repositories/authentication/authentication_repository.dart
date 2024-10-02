import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoes_store/features/authentication/screens/login/login.dart';
import 'package:shoes_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shoes_store/features/authentication/screens/signup/verify_email.dart';
import 'package:shoes_store/navigation_menu.dart';
import 'package:shoes_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:shoes_store/utils/exceptions/firebase_exceptions.dart';
import 'package:shoes_store/utils/exceptions/format_exceptions.dart';
import 'package:shoes_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // * Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // * Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // * Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);

      deviceStorage.read('isFirstTime') != true
          // Redirect to login screen if not the first time
          ? Get.offAll(() => const LoginScreen())
          // Redirect to OnBoarding screen if it's the first time
          : Get.offAll(() => const OnBoaridngScreen());
    }
  }

/* ------------------------- Email & Password Sign-in ------------------------- */
  // * [Email Authentication] - SignIn

  // * [Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AkFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AkFormatException().message;
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // * [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AkFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AkFormatException().message;
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // * [ReAuthentication] - ReAuthenticate User

  // * [Email Authentication] - Forget Password


/* ------------------------- end Federated identity * Social sign-in ------------------------- */
  // * [LogoutUser] - valid for any authentication
  
}

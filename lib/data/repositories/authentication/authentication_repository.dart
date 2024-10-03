import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../features/authentication/screens/signup/verify_email.dart';
import '../../../navigation_menu.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';


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
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

/* ------------------------- Email & Password Sign-in ------------------------- */
  // * [Email Authentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
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
  Future<void> logout() async{
    try {
      await FirebaseAuth.instance.signOut();
      deviceStorage.remove('IS_LOGGED_IN');
      Get.offAll(() => const LoginScreen());
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
}

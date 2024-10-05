import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoes_store/data/repositories/user/user_repository.dart';

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

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // * Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();

    // Check if the user has chosen to remember login
    final isRememberMe = deviceStorage.read('IS_REMEMBER_ME') ?? false;
    if (isRememberMe) {
      screenRedirect();
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
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  // * [Email Authentication] - Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
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

/* ------------------------- end Federated identity * Social sign-in ------------------------- */
  // * [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details form the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once Signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw AkFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AkFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AkFormatException().message;
    } on PlatformException catch (e) {
      throw AkPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      throw 'Something went wrong. Please try again';
    }
  }

/* ------------------------- end Federated identity * Social sign-in ------------------------- */
  // * [LogoutUser] - valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      deviceStorage.remove('IS_REMEMBER_ME');
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

  // * [DeleteUserAccount] - remove user from auth and firestore
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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

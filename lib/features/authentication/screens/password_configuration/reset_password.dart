import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.clear),
              onPressed: () {
                Get.offAll(() => const LoginScreen());
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AkSizes.defaultSpace),
            child: Column(
              children: [
                // * image
                Image.asset(AkImages.deliveredEmailIllustration),
                const SizedBox(height: AkSizes.spaceBtwSections),
                // * Email, Title and subtitle
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AkSizes.spaceBtwItems),
                Text(
                  AkTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AkSizes.spaceBtwItems),
                Text(
                  AkTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: AkSizes.spaceBtwSections),
                // * Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                      child: const Text(AkTexts.done)),
                ),
                const SizedBox(height: AkSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => ForgetPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child: const Text(AkTexts.resendEmail),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

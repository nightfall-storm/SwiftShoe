import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';
import 'widgets/verify_email_header.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
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
              // * Image & Title & SubTitle
              const VerifyEmailHeader(),
              const SizedBox(height: AkSizes.spaceBtwSections),
              // * Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                      title: AkTexts.yourAccountCreatedTitle,
                      subTitle: AkTexts.yourAccountCreatedSubTitle,
                      image: AkImages.staticSuccessIllustration,
                      onPressed: () => Get.to(() => const LoginScreen()))),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: dark ? AkColors.grey : AkColors.black,
                    foregroundColor: dark ? AkColors.black : Colors.white,
                    side: BorderSide.none,
                  ),
                  child: const Text(AkTexts.tContinue),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(AkTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

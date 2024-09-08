import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/login_signup/appbar_arrow.dart';
import 'package:shoes_store/features/authentication/screens/login/login.dart';
import 'package:shoes_store/utils/constants/image_strings.dart';
import 'package:shoes_store/utils/constants/text_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarArrow(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            children: [
              // * image
                Image.asset(AkImages.deliveredEmailIllustration),
                const SizedBox(height: AkSizes.spaceBtwSections),
              // * Title and subtitle
                Text(
                  AkTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AkSizes.spaceBtwItems),
                Text(
                  AkTexts.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AkSizes.spaceBtwSections),
              // * Buttons
                SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: dark ? AkColors.grey : AkColors.black,
                    foregroundColor: dark ? AkColors.black : Colors.white,
                    side: BorderSide.none,
                  ),
                  child: const Text(AkTexts.done)),
            ),
                const SizedBox(height: AkSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: (){}, child: const Text(AkTexts.resendEmail)),
                ),

            ],
          ),
        ),
      ),
    );
  }
}

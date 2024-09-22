import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shoes_store/navigation_menu.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AkSizes.spaceBtwSections),
        child: Column(
          children: [
            // * Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                labelText: AkTexts.email,
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwInputFields),
            // * password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.lock_1),
                border: OutlineInputBorder(),
                labelText: AkTexts.password,
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwInputFields),
            // * Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) => {}),
                    const Text(AkTexts.rememberMe),
                  ],
                ),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: Text(
                      AkTexts.forgetPassword,
                      style: TextStyle(
                          color: dark ? AkColors.grey : Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
            const SizedBox(height: AkSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.off(() => const NavigationMenu()),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: dark ? AkColors.grey : AkColors.black,
                    foregroundColor: dark ? AkColors.black : Colors.white,
                    side: BorderSide.none,
                  ),
                  child: const Text(AkTexts.signIn)),
            ),
          ],
        ),
      ),
    );
  }
}

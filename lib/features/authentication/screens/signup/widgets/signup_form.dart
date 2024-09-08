import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AkSizes.spaceBtwSections), // Updated spacing for consistency
        child: Column(
          children: [
            // * Name
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                border: OutlineInputBorder(),
                labelText: AkTexts.username,
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwInputFields),
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
            const SizedBox(height: AkSizes.spaceBtwInputFields), // Added spacing here to match the login form
            // * Terms and Privacy
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) => {}),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '${AkTexts.iAgreeTo} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${AkTexts.privacyPolicy} ',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: dark ? AkColors.grey : AkColors.black,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    dark ? AkColors.grey : AkColors.black,
                              )),
                      TextSpan(
                          text: ' ${AkTexts.and} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${AkTexts.termsOfUse}.',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: dark ? AkColors.grey : AkColors.black,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    dark ? AkColors.grey : AkColors.black,
                              )),
                    ])),
                  ],
                )
              ],
            ),
            const SizedBox(height: AkSizes.spaceBtwItems), // Ensuring same size box
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: dark ? AkColors.grey : AkColors.black,
                    foregroundColor: dark ? AkColors.black : Colors.white,
                    side: BorderSide.none,
                  ),
                  child: const Text(AkTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';
import 'terms_conditions_checkbox.dart';


class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AkSizes.spaceBtwSections),
        child: Column(
          children: [
            // * Username
            TextFormField(
              controller: controller.username,
              validator: (value) => AkValidator.validateEmptyText('Username', value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                border: OutlineInputBorder(),
                labelText: AkTexts.username,
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwInputFields),
            // * Email
            TextFormField(
              controller: controller.email,
              validator: (value) => AkValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
                labelText: AkTexts.email,
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwInputFields),
            // * Phone Number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => AkValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                labelText: AkTexts.phoneNo,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwInputFields),
            // * password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => AkValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.lock_1),
                    suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                    border: const OutlineInputBorder(),
                    labelText: AkTexts.password),
              ),
            ),
            const SizedBox(
                height: AkSizes
                    .spaceBtwInputFields), // Added spacing here to match the login form
            // * Terms and Privacy
            const TermsConditionsCheckbox(),
            const SizedBox(height: AkSizes.spaceBtwItems), // Ensuring same size box
            // * Create Account 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(AkTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configuration/forget_password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    final dark = AkHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Unfocus when tapping outside
      },
      child: Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AkSizes.spaceBtwSections),
          child: Column(
            children: [
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
              // * password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) =>
                      AkValidator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: AkTexts.password,
                      prefixIcon: const Icon(Iconsax.lock_1),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                      ),
                      border: const OutlineInputBorder(),
                      ),
                ),
              ),
              const SizedBox(height: AkSizes.spaceBtwInputFields),
              // * Remember me & Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                      ),
                      const Text(AkTexts.rememberMe),
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: Text(
                        AkTexts.forgetPassword,
                        style: TextStyle(
                            color: dark ? AkColors.white : AkColors.primary,
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
                    onPressed: () {
                      FocusScope.of(context).unfocus(); // Dismiss the keyboard
                      controller.emailAndPasswordSignIn();
                    },
                    child: const Text(AkTexts.signIn)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

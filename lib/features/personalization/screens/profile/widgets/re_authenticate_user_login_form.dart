import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AkAppBar(
        actions: const [],
        onPressed: () => Get.back(),
        title: 'Re-Authenticate User',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email
              Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: AkValidator.validateEmail,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: AkTexts.email,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: AkSizes.spaceBtwInputFields),
                    // password
                    Obx(
                      () => TextFormField(
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            AkValidator.validateEmptyText('Password', value),
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: AkTexts.password,
                          prefixIcon: const Icon(Iconsax.lock_1),
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye)),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AkSizes.spaceBtwSections),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      controller.reAuthenticateEmailAndPasswordUser(),
                  child: const Text('Verify'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

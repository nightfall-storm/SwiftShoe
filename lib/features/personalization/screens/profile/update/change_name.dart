import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/update/change_name_controller.dart';
import '../profile.dart';

class ChangeUserName extends StatelessWidget {
  const ChangeUserName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Define what happens when the back button is pressed
        Get.off(() => const ProfileScreen());
        return false; // Prevent the default back action
      },
      child: Scaffold(
        appBar: AkAppBar(
          actions: const [],
          onPressed: () => Get.off(() => const ProfileScreen()),
          title: 'Change Username',
        ),
        body: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Use Real Name for easy verification. This name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Text field and Button
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.userName,
                      validator: (value) =>
                          AkValidator.validateEmptyText('UserName', value),
                      decoration: const InputDecoration(
                        labelText: AkTexts.username,
                        prefixIcon: Icon(Iconsax.user),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserName(),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

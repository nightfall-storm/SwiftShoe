import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/features/personalization/screens/profile/profile.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/update/change_phone_number_controller.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNumberController());
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
          title: 'Change PhoneNumber',
        ),
        body: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Use Real Phone number for easy verification.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Text field and Button
              Form(
                key: controller.updatePhoneNumberFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: AkValidator.validatePhoneNumber,
                      decoration: const InputDecoration(
                        labelText: AkTexts.phoneNo,
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
                    onPressed: () => controller.updatePhoneNumber(),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

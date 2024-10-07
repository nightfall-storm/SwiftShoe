import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/update/change_gender_controller.dart';
import '../profile.dart';

class ChangeGender extends StatelessWidget {
  const ChangeGender({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateGenderController());
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
          title: 'Change Gender',
        ),
        body: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Gender for Tailored Recommendations',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Text field and Button
              Form(
                key: controller.updateUserGenderFormKey,
                child: Column(
                  children: [
                    // Gender Dropdown
                    Obx(() => DropdownButtonFormField<String>(
                          value: controller.selectedGender.value.isNotEmpty
                              ? controller.selectedGender.value
                              : null,
                          items: const [
                            DropdownMenuItem(
                              value: 'Male',
                              child: Text('Male'),
                            ),
                            DropdownMenuItem(
                              value: 'Female',
                              child: Text('Female'),
                            ),
                            DropdownMenuItem(
                              value: 'Prefer not to say',
                              child: Text('Prefer not to say'),
                            ),
                          ],
                          decoration: const InputDecoration(
                            labelText: 'Select Gender',
                            prefixIcon: Icon(Iconsax.gemini),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedGender.value = value;
                            }
                          },
                          validator: (value) => value == null
                              ? 'Please select your gender'
                              : null,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.updateUserGender(),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

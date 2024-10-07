import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/update/change_birthday_controller.dart';
import '../profile.dart';

class ChangeBirthday extends StatelessWidget {
  const ChangeBirthday({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateBirthdayController());
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
          title: 'Change Birthday',
        ),
        body: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Share Your Birthday to Unlock Special Offers.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Text field and Button
              Form(
                child: Column(
                  children: [
                    // * Date Picker directly
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: controller.userBirthday.value.isNotEmpty
                                ? DateTime.parse(controller.userBirthday.value)
                                : DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                      
                          if (pickedDate != null) {
                            controller.userBirthday.value =
                                "${pickedDate.toLocal()}"
                                    .split(' ')[0]; // Format date as yyyy-mm-dd
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Obx(() => Text(
                                controller.userBirthday.value.isNotEmpty
                                    ? controller.userBirthday.value
                                    : 'Select your birthday',
                                style: TextStyle(
                                  color: controller.userBirthday.value.isNotEmpty
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              )),
                        ),
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
                    onPressed: () => controller.updateUserBirthday(),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/change_name_controller.dart';

class ChangeUserName extends StatelessWidget {
  const ChangeUserName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AkAppBar(
        actions: const [],
        onPressed: () => Get.back(),
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
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: AkTexts.username,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwSections),

            // * Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}

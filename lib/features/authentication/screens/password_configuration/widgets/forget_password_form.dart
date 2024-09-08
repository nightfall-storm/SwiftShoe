import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../reset_password.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              labelText: AkTexts.email,
            ),
          ),
          const SizedBox(height: AkSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const ResetPassword()),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                      dark ? AkColors.grey : AkColors.black,
                  foregroundColor: dark ? AkColors.black : Colors.white,
                  side: BorderSide.none,
                ),
                child: const Text(AkTexts.submit)),
          ),
        ],
      ),
    );
  }
}

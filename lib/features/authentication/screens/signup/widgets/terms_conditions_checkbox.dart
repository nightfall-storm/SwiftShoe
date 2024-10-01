import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TermsConditionsCheckbox extends StatelessWidget {
  const TermsConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${AkTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${AkTexts.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: isDarkMode ? AkColors.white : AkColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDarkMode ? AkColors.white : AkColors.primary,
                      )),
              TextSpan(
                  text: ' ${AkTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${AkTexts.termsOfUse}.',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: isDarkMode ? AkColors.white : AkColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDarkMode ? AkColors.white : AkColors.primary,
                      )),
            ])),
          ],
        )
      ],
    );
  }
}

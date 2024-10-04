import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/authentication/controllers/login/login_controller.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AkColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: AkSizes.iconMd,
                height: AkSizes.iconMd,
                image: AssetImage(AkImages.google)),
          ),
        ),
        const SizedBox(width: AkSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AkColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: AkSizes.iconMd,
                height: AkSizes.iconMd,
                image: AssetImage(AkImages.facebook)),
          ),
        ),
      ],
    );
  }
}

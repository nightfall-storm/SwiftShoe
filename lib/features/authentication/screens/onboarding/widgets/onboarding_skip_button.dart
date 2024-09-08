import 'package:flutter/material.dart';
import 'package:shoes_store/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AkHelperFunctions.isDarkMode(context);
    return Positioned(
      left: AkSizes.defaultSpace,
      bottom: AkDeviceUtils.getBottomNavigationBarHeight() - 5 ,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        style:  ElevatedButton.styleFrom(
          backgroundColor: dark ? AkColors.grey : AkColors.black,
          foregroundColor: dark ? AkColors.black : AkColors.white,
          minimumSize: const Size(180, 30),
          elevation: 0,
          side: BorderSide.none, // Remove any border
        ),
        child: const Text('Get Started', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

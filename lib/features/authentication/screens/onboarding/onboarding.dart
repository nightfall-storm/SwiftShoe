import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_page_indicator.dart';
import 'widgets/onboarding_skip_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingPage(
                  image: AkImages.onBoardingImage1,
                  title: AkTexts.onBoardingTitle1,
                  subTitle: AkTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: AkImages.onBoardingImage2,
                  title: AkTexts.onBoardingTitle2,
                  subTitle: AkTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: AkImages.onBoardingImage3,
                  title: AkTexts.onBoardingTitle3,
                  subTitle: AkTexts.onBoardingSubTitle3,
                ),
              ],
            ),
            // * Skip Button
            const OnBoardingSkipButton(),
            // * 3 dots
            const OnBoardingPageIndicator(),
          ],
        ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lottie/lottie.dart';
import 'package:shoes_store/common/styles/spacing_style.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.subTitle,
    required this.onPressed,
    required this.image,
    required this.title,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AkSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // * Image
              Lottie.asset(
                image,
                width: AkHelperFunctions.screenWidth() * .6,
              ),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Title & SubTitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AkSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: AkSizes.spaceBtwSections),

              // * Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(AkTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

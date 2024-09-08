import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/styles/spacing_style.dart';
import 'package:shoes_store/common/widgets/login_signup/form_divider.dart';
import 'package:shoes_store/common/widgets/login_signup/social_buttons.dart';
import 'package:shoes_store/features/authentication/screens/login/login.dart';
import '../../../../common/widgets/login_signup/appbar_arrow.dart';
import '../../../../common/widgets/login_signup/not_a_member_section.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/signup_form.dart';
import 'widgets/signup_header.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const AppBarArrow()),
      body: SingleChildScrollView(
        child: Padding(
          padding: AkSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // * Signup Header
              const SignupHeader(),
              // * Signup Form
              const SignupForm(),
              // * Divider
              const FormDivider(),
              const SizedBox(height: AkSizes.spaceBtwSections),
              // * Footer
              // * Social Buttons
              const SocialButtons(),
              // * not a memeber&Signup Section
              NotMemberSection(
                  firstText: 'Already have an account?',
                  secondText: 'Sign In',
                  getTo: () => Get.offAll(() => const LoginScreen())),
            ],
          ),
        ),
      ),
    );
  }
}




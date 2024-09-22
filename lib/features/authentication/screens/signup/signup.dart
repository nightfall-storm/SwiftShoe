import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/login_signup/form_divider.dart';
import 'package:shoes_store/common/widgets/login_signup/social_buttons.dart';
import 'package:shoes_store/features/authentication/screens/login/login.dart';
import '../../../../common/widgets/login_signup/not_a_member_section.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/signup_form.dart';
import 'widgets/signup_header.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () {
              Get.offAll(() => const LoginScreen());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: AkSizes.defaultSpace,
            bottom: AkSizes.defaultSpace,
            right: AkSizes.defaultSpace,
          ),
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

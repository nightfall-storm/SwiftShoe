import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/authentication/screens/signup/signup.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import '../../../../common/styles/spacing_style.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../controllers/login/login_controller.dart';
import 'widgets/login_header.dart';
import '../../../../common/widgets/login_signup/not_a_member_section.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    // ignore: deprecated_member_use
    return  WillPopScope(
      onWillPop: () async {
        controller.handleBackNavigation();
        return false; // Prevent the default pop behavior
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: AkSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                // * Login Header
                const LoginHeader(),
                // * Form
                const LoginForm(),
                // * Divider
                const FormDivider(),
                const SizedBox(height: AkSizes.spaceBtwSections),
                // * Footer
                // * SocialButtons to Login
                const SocialButtons(),
                // * not a memeber&Signup Section
                NotMemberSection(firstText: 'Not a member?', secondText: 'Create an account', getTo: () => Get.to(() => const SignupScreen()),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


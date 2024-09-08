import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/login_signup/appbar_arrow.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import '../../../../common/styles/spacing_style.dart';
import 'widgets/forget_password_form.dart';
import 'widgets/forget_password_header.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarArrow(),
      ),
      body: const Padding(
        padding: AkSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            ForgetPasswordHeader(),
            SizedBox(height: AkSizes.spaceBtwSections / 2),
            ForgetPasswordForm(),
          ],
        ),
      ),
    );
  }
}



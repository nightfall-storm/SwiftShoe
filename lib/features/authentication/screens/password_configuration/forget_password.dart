import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/utils/constants/sizes.dart';
import '../../../../common/styles/spacing_style.dart';
import '../login/login.dart';
import 'widgets/forget_password_form.dart';
import 'widgets/forget_password_header.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () {
              Get.offAll(() => const LoginScreen());
            },
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: AkSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ForgetPasswordHeader(),
              SizedBox(height: AkSizes.spaceBtwSections / 2),
              ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}



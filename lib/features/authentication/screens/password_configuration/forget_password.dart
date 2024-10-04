import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_style.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../login/login.dart';
import 'widgets/forget_password_header.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        controller.handleBackNavigation();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            padding: AkSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                const ForgetPasswordHeader(),
                const SizedBox(height: AkSizes.spaceBtwSections / 2),
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: AkValidator.validateEmail,
                    focusNode: controller.emailFocusNode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      labelText: AkTexts.email,
                    ),
                  ),
                ),
                const SizedBox(height: AkSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text(AkTexts.submit),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

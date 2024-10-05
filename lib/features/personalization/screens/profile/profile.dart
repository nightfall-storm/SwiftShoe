import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import 'widgets/change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AkAppBar(
        onAction: () {},
        onPressed: () => Get.back(),
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            children: [
              // * Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const AkCircularImage(
                        image: AkImages.user,
                        width: 80,
                        height: 80,
                        applyColor: false,
                        applyOverlayColor: false),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              // * Details 
              const SizedBox(height: AkSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              // ? Heading Profile Info
              const AkSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AkSizes.spaceBtwItems),
              AkProfileMenu(title: 'Username', value: controller.user.value.username, onTap: () => Get.to(() => const ChangeUserName())),
              AkProfileMenu(title: 'E-mail', value: controller.user.value.email, onTap: (){}),
              const SizedBox(height: AkSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              // ? Heading Personal Info
              const AkSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: AkSizes.spaceBtwItems),
              AkProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onTap: (){}),
              AkProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onTap: (){}),
              AkProfileMenu(title: 'Gender', value: 'Male', onTap: (){}),
              AkProfileMenu(title: 'Date of Birth', value: '10 Mar, 2003', onTap: (){}),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              Center(child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(), child: const Text('Close Account', style: TextStyle(color: Colors.red),)),)
            ],
            
          ),
        ),
      ),
    );
  }
}


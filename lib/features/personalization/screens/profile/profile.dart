import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/data/services/dummy_data.dart';

import '../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/containers/section_cotainer.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';
import 'update/change_birthday.dart';
import 'update/change_gender.dart';
import 'update/change_name.dart';
import 'update/change_phone_number.dart';
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
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : AkImages.user;

                      return controller.imageUploading.value
                          ? const AkShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : AkCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              applyColor: false,
                              applyOverlayColor: false,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              // * Details
              const SizedBox(height: AkSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              // ? Heading Profile Info
              const AkSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AkSizes.spaceBtwItems),
              AkProfileMenu(
                  title: 'Username',
                  value: controller.user.value.username,
                  onTap: () => Get.off(() => const ChangeUserName())),
              AkProfileMenu(
                  title: 'E-mail',
                  value: controller.user.value.email,
                  onTap: () {}),
              const SizedBox(height: AkSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              // ? Heading Personal Info
              const AkSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: AkSizes.spaceBtwItems),
              AkProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onTap: () {}),
              Obx(
                () => AkProfileMenu(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onTap: () => Get.off(() => const ChangePhoneNumber()),
                ),
              ),
              AkProfileMenu(
                  title: 'Gender',
                  value: controller.user.value.gender,
                  onTap: () => Get.off(() => const ChangeGender())),
              AkProfileMenu(
                  title: 'Date of Birth',
                  value: controller.user.value.birthday,
                  onTap: () => Get.off(() => const ChangeBirthday())),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
              Center(
                child: TextButton(
                    onPressed: () =>
                        AkDummyData.uploadDummyBrandsAndCollections(),
                    child: const Text(
                      'Upload Data',
                      style: TextStyle(color: Colors.green),
                    )),
              ),
              Center(
                child: TextButton(
                  onPressed: () => AkDummyData.uploadDummyBanners(),
                  child: const Text(
                    'Upload Banners',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () => AkDummyData.uploadDummyProducts(),
                  child: const Text(
                    'Upload Products',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

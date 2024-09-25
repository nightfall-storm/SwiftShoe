import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/containers/section_cotainer.dart';
import 'package:shoes_store/common/widgets/images/circular_image.dart';
import 'package:shoes_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shoes_store/utils/constants/image_strings.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AkAppBar(
        onAction: () {},
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
              AkProfileMenu(title: 'Name', value: 'nightfall', onTap: (){}),
              AkProfileMenu(title: 'Username', value: 'tsunaim', onTap: (){}),
              const SizedBox(height: AkSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              // ? Heading Personal Info
              const AkSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: AkSizes.spaceBtwItems),
              AkProfileMenu(title: 'User ID', value: '1337',icon: Iconsax.copy, onTap: (){}),
              AkProfileMenu(title: 'E-mail', value: 'night-fall@gmail.com', onTap: (){}),
              AkProfileMenu(title: 'Phone Number', value: '0665010010', onTap: (){}),
              AkProfileMenu(title: 'Gender', value: 'Male', onTap: (){}),
              AkProfileMenu(title: 'Date of Birth', value: '10 Mar, 2003', onTap: (){}),
              const Divider(),
              const SizedBox(height: AkSizes.spaceBtwItems),
              Center(child: TextButton(onPressed: (){}, child: const Text('Close Account', style: TextStyle(color: Colors.red),)),)
            ],
            
          ),
        ),
      ),
    );
  }
}


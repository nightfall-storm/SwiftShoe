// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/containers/section_cotainer.dart';
import 'package:shoes_store/common/widgets/list_tiles/settings_menu_tile.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AkAppBar(onAction: () {}, title: 'Settings'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * User Profile card
            AkUserProfileTile(),

            // * Body
            Padding(
              padding: EdgeInsets.all(AkSizes.defaultSpace),
              child: Column(
                children: [
                  // * Account Settings
                  AkSectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: AkSizes.spaceBtwItems),
                  AkSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: "My Addresses",
                      subtitle: 'Set shopping delivery address',
                      onTap: () {}),
                  AkSettingsMenuTile(icon: Iconsax.shopping_cart,title: 'My Cart', subtitle: 'Add, remove products and move to checkout',onTap: (){}),
                  AkSettingsMenuTile(icon: Iconsax.bag_tick,title: 'My Orders', subtitle: 'In-Progress and Completed Orders',onTap: (){}),
                  AkSettingsMenuTile(icon: Iconsax.bank,title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account',onTap: (){}),
                  AkSettingsMenuTile(icon: Iconsax.discount_shape,title: 'My Coupons', subtitle: 'List of all the discounted coupons',onTap: (){}),
                  AkSettingsMenuTile(icon: Iconsax.notification1,title: 'Notifications', subtitle: 'Set any kind of notification message',onTap: (){}),
                  AkSettingsMenuTile(icon: Iconsax.security_card,title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts',onTap: (){}),

                  // * App Settings
                  SizedBox(height: AkSizes.spaceBtwItems),
                  AkSectionHeading(title: 'App Settings', showActionButton: false),
                  SizedBox(height: AkSizes.spaceBtwItems),
                  AkSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase',),
                  AkSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'GeoLocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value){})
                  ),
                  AkSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value){})
                  ),
                  AkSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality',
                    trailing: Switch(value: false, onChanged: (value) {})
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

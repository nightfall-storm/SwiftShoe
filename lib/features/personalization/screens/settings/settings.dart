
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/containers/section_cotainer.dart';
import 'package:shoes_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:shoes_store/features/personalization/screens/address/address.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/navigation_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        handleBackNavigation(); // Call the reusable back navigation function
        return false; // Prevent the default pop behavior
      },
      child: Scaffold(
        appBar: AkAppBar(onAction: () {}, title: 'Settings',),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // * User Profile card
              const AkUserProfileTile(),
      
              // * Body
              Padding(
                padding: const EdgeInsets.all(AkSizes.defaultSpace),
                child: Column(
                  children: [
                    // * Account Settings
                    const AkSectionHeading(title: 'Account Settings', showActionButton: false),
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    AkSettingsMenuTile(icon: Iconsax.safe_home, title: "My Addresses", subtitle: 'Set shopping delivery address', onTap: () => Get.to(() => const UserAddressScreen())),
                    AkSettingsMenuTile(icon: Iconsax.shopping_cart,title: 'My Cart', subtitle: 'Add, remove products and move to checkout',onTap: () {}),
                    AkSettingsMenuTile(icon: Iconsax.bag_tick,title: 'My Orders', subtitle: 'In-Progress and Completed Orders',onTap: (){}),
                    AkSettingsMenuTile(icon: Iconsax.bank,title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account',onTap: (){}),
                    AkSettingsMenuTile(icon: Iconsax.discount_shape,title: 'My Coupons', subtitle: 'List of all the discounted coupons',onTap: (){}),
                    AkSettingsMenuTile(icon: Iconsax.notification1,title: 'Notifications', subtitle: 'Set any kind of notification message',onTap: (){}),
                    AkSettingsMenuTile(icon: Iconsax.security_card,title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts',onTap: (){}),
      
                    // * App Settings
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    const AkSectionHeading(title: 'App Settings', showActionButton: false),
                    const SizedBox(height: AkSizes.spaceBtwItems),
                    const AkSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase',),
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
      ),
    );
  }
}

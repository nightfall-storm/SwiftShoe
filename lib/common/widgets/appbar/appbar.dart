import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/utils/constants/colors.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../products/cart/cart_menu_icon.dart';

class AkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AkAppBar({
    super.key,
    this.title,
    this.isHomeScreen = false,
    this.showBackArrow = false,
    this.leadingOnPressed,
    this.actions,
  });

  final String? title;
  final bool isHomeScreen;
  final bool showBackArrow;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = AkHelperFunctions.isDarkMode(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isHomeScreen
          ? IconButton(
              onPressed:
                  leadingOnPressed ?? () {}, // Ensure menu icon is functional
              icon: Icon(
                Iconsax.menu, color: darkMode ? AkColors.white : AkColors.black,
              ),
            )
          : showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Iconsax.arrow_left, color: darkMode ? AkColors.white : AkColors.black,),
                )
              : null,
      title: isHomeScreen
          ? Align(
              alignment: Alignment.center,
              child: Image.asset(
                  darkMode ? AkImages.lightAppBarLogo : AkImages.darkAppBarLogo,
                  height: 70), // Adjust height as needed
            )
          : Align(
            alignment: Alignment.center,
            child: Text(
                title!,
                style: TextStyle(
                  color: darkMode ? AkColors.white : AkColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
      actions: isHomeScreen
          ? [
              AkCartCounterIcon(darkMode: darkMode),
            ]
          : [
              IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.search_normal, color: darkMode ? AkColors.white : AkColors.black),
              ),
              ...?actions,
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}


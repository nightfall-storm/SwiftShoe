import 'package:flutter/material.dart';
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
    this.onPressed,
  });

  final String? title;
  final bool isHomeScreen;
  final bool showBackArrow;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isHomeScreen
          ? IconButton(
              onPressed:
                  leadingOnPressed ?? () {}, // Ensure menu icon is functional
              icon: Icon(
                Iconsax.menu,
                color: isDarkMode ? AkColors.white : AkColors.black,
              ),
            )
          : showBackArrow
              ? IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Iconsax.arrow_left,
                    color: isDarkMode ? AkColors.white : AkColors.black,
                  ),
                )
              : null,
      title: isHomeScreen
          ? Align(
              alignment: Alignment.center,
              child: Image.asset(
                  isDarkMode
                      ? AkImages.lightAppBarLogo
                      : AkImages.darkAppBarLogo,
                  height: 70), // Adjust height as needed
            )
          : Align(
              alignment: Alignment.center,
              child: Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: isDarkMode ? AkColors.white : AkColors.black),
              ),
            ),
      actions: isHomeScreen
          ? [
              AkCartCounterIcon(darkMode: isDarkMode),
            ]
          : [
              IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.search_normal,
                    color: isDarkMode ? AkColors.white : AkColors.black),
              ),
              ...?actions,
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

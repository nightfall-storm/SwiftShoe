import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class AkSearchContainer extends StatelessWidget {
  const AkSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBorder = true,
    this.showBackground = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool darkMode = AkHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, right: 34, left: 34),
        child: Container(
          width: AkDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AkSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: AkColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(Iconsax.search_normal,
                  color: showBackground
                      ? darkMode
                          ? AkColors.light
                          : AkColors.dark
                      : Colors.transparent),
              const SizedBox(width: AkSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}

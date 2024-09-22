import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
// ? Custom CircularIcon widget with a background Color
// ? Proprities are :
// ? Container {Width}, {Height} & {backgroundColor}
// ?
// ? Icon's {Size}, {color} , {onPressed}

class AkCircularIcon extends StatelessWidget {
  const AkCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = AkSizes.lg,
    this.backgroundColor,
    this.iconColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AkHelperFunctions.isDarkMode(context);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : isDarkMode
                ? AkColors.black.withOpacity(0.9)
                : AkColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: iconColor, size: size,)),
    );
  }
}

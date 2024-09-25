import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AkCircularImage extends StatelessWidget {
  const AkCircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = AkSizes.sm,
    this.applyColor = true,
    this.applyOverlayColor = true,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool applyColor;
  final bool applyOverlayColor;

  Color _getBackgroundColor(bool isDarkMode) {
    if (!applyColor) return Colors.transparent;
    return backgroundColor ?? (isDarkMode ? AkColors.black : AkColors.white);
  }

  Color? _getOverlayColor(bool isDarkMode) {
    if (!applyOverlayColor) return null;
    return overlayColor ?? (isDarkMode ? AkColors.white : AkColors.black);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: _getBackgroundColor(isDarkMode),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: _getOverlayColor(isDarkMode),
        ),
      ),
    );
  }
}

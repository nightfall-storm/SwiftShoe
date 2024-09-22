import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/utils/constants/enums.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class AkBrandTitleWithVerifiedIcon extends StatelessWidget {
  const AkBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AkColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
    this.mainAxisSize = MainAxisSize.min,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mainAxisSize,
      children: [
        Flexible(
          child: AkBrandTitleText(
              title: title,
              color: textColor,
              textAlign: textAlign,
              maxLines: maxLines,
              brandTextSize: brandTextSize),
        ),
        const SizedBox(height: AkSizes.xs),
        const Icon(Iconsax.verify5,
            color: AkColors.primary, size: AkSizes.iconXs),
      ],
    );
  }
}

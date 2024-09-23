import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_verified_icon.dart';

class AkBrandCard extends StatelessWidget {
  const AkBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AkRoundedContainer(
        padding: const EdgeInsets.all(AkSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
        child: Row(
          children: [
            // * Icon
            const Flexible(child: AkCircularImage(image: AkImages.nikeLogo)),
            const SizedBox(height: AkSizes.spaceBtwItems),
            // * Text

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AkBrandTitleWithVerifiedIcon(
                      title: 'Nike', brandTextSize: TextSizes.large),
                  Text('256 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

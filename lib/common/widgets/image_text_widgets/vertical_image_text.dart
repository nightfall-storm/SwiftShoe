import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AkVerticalImageText extends StatelessWidget {
  const AkVerticalImageText({
    super.key,
    required this.title,
    this.onTap,
    this.textColor = AkColors.black,
    this.backgroundColor = AkColors.white,
    required this.image,
  });
  final String image, title;
  final void Function()? onTap;
  final Color textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AkHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AkSizes.defaultSpace),
        child: Column(
          children: [
            // * Circular Icon
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: AkColors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: backgroundColor ??
                          (isDarkMode
                              ? AkColors.darkGrey
                              : AkColors.grey))),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  height: 30,
                  fit: BoxFit.cover,
                  color: isDarkMode ? AkColors.dark : AkColors.black,
                ),
              ),
            ),
            const SizedBox(height: AkSizes.spaceBtwItems / 2),
            // * labelText
            SizedBox(
                child: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: backgroundColor ??
                      (AkHelperFunctions.isDarkMode(context)
                          ? AkColors.light
                          : AkColors.black)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }
}

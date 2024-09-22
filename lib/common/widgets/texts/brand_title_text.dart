import 'package:flutter/material.dart';
import 'package:shoes_store/utils/constants/enums.dart';

class AkBrandTitleText extends StatelessWidget {
  const AkBrandTitleText(
      {super.key,
      this.color,
      required this.title,
      required this.maxLines,
      required this.brandTextSize,
      this.textAlign});

  final Color? color;
  final String title;
  final int maxLines;
  final TextSizes brandTextSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      // * adjust style as which brandSize required
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}

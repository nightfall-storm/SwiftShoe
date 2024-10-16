import 'package:flutter/material.dart';

class AkProductPriceText extends StatelessWidget {
  const AkProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });
  final String price, currencySign;
  final bool isLarge;
  final bool lineThrough;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineSmall!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
class AkCartCounterIcon extends StatelessWidget {
  const AkCartCounterIcon({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows overflow of the container
      children: [
        IconButton(
          onPressed:
              () {}, // Implement action for the shopping bag icon
          icon: Icon(Iconsax.shopping_bag, color: darkMode ? AkColors.white : AkColors.black),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: darkMode ? AkColors.grey : AkColors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
                child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: darkMode ? AkColors.black : AkColors.white, fontSizeFactor: 0.8),
            )),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AkSingleAddress extends StatelessWidget {
  const AkSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return AkRoundedContainer(
        padding: const EdgeInsets.all(AkSizes.md),
        borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
        width: double.infinity,
        showBorder: true,
        backgroundColor: selectedAddress
            ? AkColors.primary.withOpacity(0.5)
            : Colors.transparent,
        borderColor: selectedAddress
            ? Colors.transparent
            : isDarkMode
                ? AkColors.darkerGrey
                : AkColors.grey,
        margin: const EdgeInsets.only(bottom: AkSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(
                selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? isDarkMode
                        ? AkColors.light
                        : AkColors.dark
                    : null,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jessica Don',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AkSizes.sm / 2),
                const Text('(+212) 665 848 688'),
                const SizedBox(height: AkSizes.sm / 2),
                const Text('90060 Casabarata, Tangier-Tetouan-AL Hoceima, Morocco', softWrap: true,)
              ],
            )
          ],
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AkOrderListItems extends StatelessWidget {
  const AkOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AkHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 8,
      separatorBuilder: (_, __) =>
          const SizedBox(height: AkSizes.spaceBtwItems),
      itemBuilder: (_, index) => AkRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(AkSizes.md),
        borderRadius: BorderRadius.circular(AkSizes.borderRadiusLg),
        backgroundColor: isDarkMode ? AkColors.dark : AkColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // * 1st Row
            Row(
              children: [
                // * Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: AkSizes.spaceBtwItems / 2),

                // * Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: AkColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '15 Oct, 2024',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                // * Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: AkSizes.iconSm,
                  ),
                ),
              ],
            ),

            // * 2nd Row
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // * Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: AkSizes.spaceBtwItems / 2),

                      // * Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text(
                              '[#1337A]',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // * Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: AkSizes.spaceBtwItems / 2),

                      // * Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium),
                            Text(
                              '12 Nov, 2024',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

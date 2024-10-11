import 'package:flutter/widgets.dart';
import 'package:shoes_store/common/widgets/shimmer/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class AkBrandShimmer extends StatelessWidget {
  const AkBrandShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: AkSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Image
                AkShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: AkSizes.spaceBtwItems / 2),

                // Text
                AkShimmerEffect(width: 55, height: 8),

              ]);
        },
      ),
    );
  }
}

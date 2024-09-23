import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AkCategoryTab extends StatelessWidget {
  const AkCategoryTab({
    super.key, required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(AkSizes.defaultSpace),
      child: Column(
        children: [
          // * Brands
          AkBrandShowcase(images: images),
        ],
      ),
    );
  }
}

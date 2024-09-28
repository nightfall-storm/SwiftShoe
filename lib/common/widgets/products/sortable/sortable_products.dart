import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class AkSortableProducts extends StatelessWidget {
  const AkSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Dropdown filter
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ['Name','Price: Low to High','Price: High to Low','Most Popular','Newest Arrivals'].map((option) => DropdownMenuItem(value: option ,child: Text(option))).toList() ,
          onChanged: (value) {},
        ),
        const SizedBox(height: AkSizes.spaceBtwSections),
        AkGridLayout(itemCount: 10, itemBuilder: (_, index) => const AkProductCardVertical()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/image_strings.dart';

class AkHomeHeader extends StatelessWidget {
  const AkHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * SearchBar
        const Padding(
          padding: EdgeInsets.only(bottom: 24, right: 34, left: 34),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.search_normal_1),
              border: OutlineInputBorder(),
              hintText: 'Search Product',
            ),
          ),
        ),
        // * HomeBanner
        Container(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Image.asset(
                AkImages.homeBanner,
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants/image_strings.dart';

class AkHeaderContainer extends StatelessWidget {
  const AkHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * HomeBanner
        Container(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Image.asset(
                AkImages.homeBanner,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

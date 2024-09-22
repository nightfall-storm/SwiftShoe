import 'package:flutter/material.dart';

import '../image_text_widgets/vertical_image_text.dart';
import '../../../utils/constants/image_strings.dart';

class AkCategoriesHorizontal extends StatelessWidget {
  const AkCategoriesHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return AkVerticalImageText(
            title: 'Nike',
            image: AkImages.nikeLogo,
            backgroundColor: null,
            onTap: () {},
          );
        },
      ),
    );
  }
}

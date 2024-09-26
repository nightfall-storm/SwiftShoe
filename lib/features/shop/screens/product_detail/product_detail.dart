import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shoes_store/utils/constants/colors.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AkAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * Product Image Slider
            AkCurvedEdges(
                child: Container(
              color: AkHelperFunctions.isDarkMode(context)
                  ? AkColors.darkerGrey
                  : AkColors.light,
              child: const Stack(
                children: [
                  // ? Main Large Image
                  Image(image: AssetImage(AkImages.productImage9))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

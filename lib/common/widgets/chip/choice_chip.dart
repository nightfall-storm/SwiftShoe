import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shoes_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class AkChoiceChip extends StatelessWidget {
  const AkChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = AkHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? AkColors.white : null),
      avatar: isColor
          ? AkCircularContainer(
              width: 50,
              height: 50,
              backgroundColor: AkHelperFunctions.getColor(text)!) : null,
      shape: isColor ? const CircleBorder() : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      backgroundColor: isColor ? AkHelperFunctions.getColor(text)! : null,
      // selectedColor: isColor ? AkHelperFunctions.getColor(text)! : null,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AkRoundedContainer extends StatelessWidget {
  const AkRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.borderRadius,
    this.backgroundColor = AkColors.white,
    this.borderColor = AkColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final bool showBorder;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,  // Accept the custom BorderRadius
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}

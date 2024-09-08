import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class AkPrimaryHeaderContainer extends StatelessWidget {
  const AkPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AkCurvedEdges(
      child: Container(
        color: AkColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              // Positioned circular decorations
              Positioned(
                  top: 150,
                  right: 320,
                  child: AkCircularContainer(
                      backgroundColor: AkColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: -150,
                  right: -250,
                  child: AkCircularContainer(
                      backgroundColor: AkColors.textWhite.withOpacity(0.1))),
              
              // Add your child widget here
              Align(
                alignment: Alignment.center, // Adjust alignment as needed
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


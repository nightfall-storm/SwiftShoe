import 'package:flutter/material.dart';

import 'curved_edges.dart';

class AkCurvedEdges extends StatelessWidget {
  const AkCurvedEdges({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AkCustomCurvedEdges(),
      child: child,
    );
  }
}

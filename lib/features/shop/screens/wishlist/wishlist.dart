import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AkAppBar(showBackArrow: true),
    );
  }
}
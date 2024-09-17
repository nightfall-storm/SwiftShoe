// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';

import '../../../../utils/constants/image_strings.dart';
import 'widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * Reusable AppBar
      appBar: const AkAppBar(
        isHomeScreen: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // * Header SearchBar & Banner
            AkHomeHeader(),
            
            // * Categories
          ],
        ),
      ),
    );
  }
}


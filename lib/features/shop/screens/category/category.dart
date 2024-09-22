// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AkAppBar(
        showBackArrow: true,
        title: 'Category',
      ),
    );
  }
}
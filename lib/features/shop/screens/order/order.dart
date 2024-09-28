import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_store/common/widgets/appbar/appbar.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

import 'widgets/order_list_items.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * AppBar
      appBar: AkAppBar(
        title: 'Orders',
        onPressed: () => Get.back(),
        actions: const [],
      ),
      body: const Padding(
        padding: EdgeInsets.all(AkSizes.defaultSpace),
        // * Orders
        child: AkOrderListItems(),
      ),
    );
  }
}

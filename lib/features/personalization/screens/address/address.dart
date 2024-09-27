import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: AkColors.primary,
        child: const Icon(Iconsax.add, color: AkColors.white),
      ),
      appBar: AkAppBar(
        title: 'Addresses',
        onPressed: () => Get.back(),
        actions: const [],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AkSizes.defaultSpace),
          child: Column(
            children: [
              AkSingleAddress(selectedAddress: true),
              AkSingleAddress(selectedAddress: false),
              AkSingleAddress(selectedAddress: false),
              AkSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}

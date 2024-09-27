import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_store/utils/constants/sizes.dart';

import '../../../../common/styles/spacing_style.dart';
import '../../../../common/widgets/appbar/appbar.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AkAppBar(
        title: 'Add new Address',
        onPressed: () => Get.back(),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: AkSizes.appBarHeight),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AkSizes.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                  const SizedBox(
                    height: AkSizes.spaceBtwInputFields,
                  ),
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
                  const SizedBox(
                    height: AkSizes.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))),
                      const SizedBox(width: AkSizes.spaceBtwInputFields),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Zip Code'))),                    
                    ],
                  ),
                  const SizedBox(height: AkSizes.spaceBtwInputFields),
                  Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
                      const SizedBox(width: AkSizes.spaceBtwInputFields),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))),                    
                    ],
                  ),
                  const SizedBox(height: AkSizes.spaceBtwInputFields),
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
                  const SizedBox(height: AkSizes.defaultSpace),
                  SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text('Save')),)
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/cart/cart.dart';
import 'features/shop/screens/category/category.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/wishlist/wishlist.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = AkHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: dark ? AkColors.black : AkColors.white,
          indicatorColor: dark
              ? AkColors.white.withOpacity(0.1)
              : AkColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            NavigationDestination(
                icon: Icon(Iconsax.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Iconsax.category), label: 'Category'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const WishListScreen(),
    const CartScreen(),
    const CategoryScreen(),
    const SettingsScreen(),
  ];
}

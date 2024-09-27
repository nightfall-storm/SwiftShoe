import 'package:get/get.dart';
import 'package:shoes_store/navigation_menu.dart';

void handleBackNavigation() {
  final navigationController = Get.find<NavigationController>();
  navigationController.selectedIndex.value = 0;

  // Navigate back to NavigationMenu
  Get.to(() => const NavigationMenu());
}

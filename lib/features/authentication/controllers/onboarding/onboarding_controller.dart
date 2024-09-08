import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoes_store/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // * Variables 
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // * Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value;

  // * Jump to the specific dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // * Update Current Index & jump to the next Page
  void nextPage(){
    if(currentPageIndex.value == 2){
      Get.offAll(() => const LoginScreen());
    }else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // * Update Current Index & jump to the last Page
  void skipPage(){
    currentPageIndex.value = 2;
    Get.offAll(() => const LoginScreen());
  }
   


}
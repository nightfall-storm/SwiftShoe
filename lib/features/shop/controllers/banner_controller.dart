import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shoes_store/features/shop/models/banner_model.dart';

class BannerController extends GetxController {
  // Initialize logger
  final Logger logger = Logger();

  final isLoading = true.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final RxList<bool> imageLoadStatus = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }

  // Fetch Banners
    Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      
      final querySnapshot = await FirebaseFirestore.instance.collection('Banners').get();
      
      banners.value = querySnapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
      imageLoadStatus.value = List.generate(banners.length, (_) => false);
      
      // Preload images
      for (int i = 0; i < banners.length; i++) {
        precacheImage(CachedNetworkImageProvider(banners[i].imageUrl), Get.context!).then((_) {
          imageLoadStatus[i] = true;
        });
      }
    } catch (e) {
      logger.e("Error fetching banners: $e");
    } finally {
      isLoading.value = false;
    }
  }

  bool isImageLoaded(int index) {
    return index < imageLoadStatus.length ? imageLoadStatus[index] : false;
  }
}

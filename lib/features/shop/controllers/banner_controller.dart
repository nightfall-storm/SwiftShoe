import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shoes_store/features/shop/models/banner_model.dart';

class BannerController extends GetxController {
  // Initialize logger
  final Logger logger = Logger();

  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

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
      isLoading.value = true; // Set loading to true
      logger.i("Fetching banners..."); // Log the fetching action

      final querySnapshot =
          await FirebaseFirestore.instance.collection('Banners').get();

      // Convert documents to BannerModel instances
      banners.value = querySnapshot.docs.map((doc) {
        return BannerModel.fromSnapshot(doc); // Use your fromSnapshot method
      }).toList();

      if (banners.isEmpty) {
        // Handle case when no banners are retrieved
        logger.w("No banners found"); // Log a warning
      } else {
        logger.i(
            "Banners fetched: ${banners.toList()}"); // Log the fetched banners
      }
    } catch (e) {
      logger.e("Error fetching banners: $e"); // Log any errors
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }
}

import 'package:get/get.dart';

import 'package:shoes_store/utils/popups/loaders.dart';

import '../../../data/repositories/brands/brand_repository.dart';
import '../models/brand_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final _brandRepository = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  // * Load brand data
  Future<void> fetchBrands() async {
    try {
      // show loader while loading brands
      isLoading.value = true;

      // Fetch brands from data source
      final brands = await _brandRepository.getAllBrands();
      
      // Update the brands list
      allBrands.assignAll(brands);

      // Filter featured brands
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured && brand.parentId.isEmpty).take(8).toList());
      
    } catch (e) {
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {}
  }
}

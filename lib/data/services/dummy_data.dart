import 'package:get/get.dart';
import 'package:shoes_store/features/shop/models/brand_model.dart';
import 'package:shoes_store/data/repositories/brands/brand_repository.dart';

class AkDummyData {
  static Future<void> uploadDummyBrands() async {
    final brands = [
      BrandModel(
        id: 'brand1',
        name: 'Nike',
        image: 'assets/icons/brands/nike.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'brand2',
        name: 'Adidas',
        image: 'assets/icons/brands/adidas-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'brand3',
        name: 'Puma',
        image: 'assets/icons/brands/puma-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'brand4',
        name: 'Brooks',
        image: 'assets/icons/brands/brooks-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'brand5',
        name: 'Jordan',
        image: 'assets/icons/brands/jordan-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'brand6',
        name: 'Crocs',
        image: 'assets/icons/brands/crocs-logo.png',
        isFeatured: true,
      ),
    ];

    try {
      // Upload the dummy data to Firebase
      await BrandRepository.instance.uploadDummyData(brands);
      Get.snackbar('Success', 'Dummy brands uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

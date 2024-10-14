import 'package:logger/logger.dart';
import 'package:shoes_store/data/repositories/banners/banner_repository.dart';
import 'package:shoes_store/features/shop/models/banner_model.dart';
import 'package:shoes_store/features/shop/models/collection_model.dart';
import 'package:shoes_store/data/repositories/collections/collection_repository.dart';

import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';

class AkDummyData {
  static final Logger logger = Logger();
  static Future<void> uploadDummyBanners() async {
    final banners = [
      BannerModel(active: true, imageUrl: AkImages.homeBanner1, targetScreen: AkRoutes.home),
      BannerModel(active: true, imageUrl: AkImages.homeBanner2, targetScreen: AkRoutes.home),
      BannerModel(active: true, imageUrl: AkImages.homeBanner3, targetScreen: AkRoutes.home),
    ];
    try {
      // Upload the dummy Banners data to Firebase
      await BannerRepository.instance.uploadDummyData(banners);

      // Log success message
      logger.i('Success: Banners uploaded successfully');
    } catch (e) {
      // Log error message
      logger.e('Error: $e');
    }
  }

  static Future<void> uploadDummyBrandsAndCollections() async {
    // final brands = [
    //   BrandModel(
    //     id: 'nike',
    //     name: 'Nike',
    //     image: 'assets/icons/brands/nike.png',
    //     isFeatured: true,
    //   ),
    //   BrandModel(
    //     id: 'adidas',
    //     name: 'Adidas',
    //     image: 'assets/icons/brands/adidas-logo.png',
    //     isFeatured: true,
    //   ),
    //   BrandModel(
    //     id: 'puma',
    //     name: 'Puma',
    //     image: 'assets/icons/brands/puma-logo.png',
    //     isFeatured: true,
    //   ),
    //   BrandModel(
    //     id: 'brooks',
    //     name: 'Brooks',
    //     image: 'assets/icons/brands/brooks-logo.png',
    //     isFeatured: true,
    //   ),
    //   BrandModel(
    //     id: 'jordan',
    //     name: 'Jordan',
    //     image: 'assets/icons/brands/jordan-logo.png',
    //     isFeatured: true,
    //   ),
    //   BrandModel(
    //     id: 'crocs',
    //     name: 'Crocs',
    //     image: 'assets/icons/brands/crocs-logo.png',
    //     isFeatured: true,
    //   ),
    // ];

    final collections = [
      CollectionModel(
        id: 'men',
        name: 'Men',
        isFeatured: true,
      ),
      CollectionModel(
        id: 'women',
        name: 'Women',
        isFeatured: true,
      ),
      CollectionModel(
        id: 'kids',
        name: 'Kids',
        isFeatured: false,
      ),
      CollectionModel(
        id: 'sports',
        name: 'Sports',
        isFeatured: true,
      ),
      CollectionModel(
        id: 'formal',
        name: 'Formal',
        isFeatured: true,
      ),
      CollectionModel(
        id: 'casual',
        name: 'Casual',
        isFeatured: true,
      ),
    ];

    try {
      // Upload the dummy brands data to Firebase
      // await BrandRepository.instance.uploadDummyData(brands);
      // Get.snackbar('Success', 'Dummy brands uploaded successfully');

      // Upload the dummy collections data to Firebase
      await CollectionRepository.instance.uploadDummyData(collections);

      // Log success message
      logger.i('Success: Dummy collections uploaded successfully');
    } catch (e) {
      // Log error message
      logger.e('Error: $e');
    }
  }
}

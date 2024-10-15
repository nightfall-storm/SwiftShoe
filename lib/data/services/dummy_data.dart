import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shoes_store/data/repositories/banners/banner_repository.dart';
import 'package:shoes_store/data/repositories/products/product_repository.dart';
import 'package:shoes_store/features/shop/models/banner_model.dart';
import 'package:shoes_store/features/shop/models/brand_model.dart';
import 'package:shoes_store/features/shop/models/collection_model.dart';
import 'package:shoes_store/data/repositories/collections/collection_repository.dart';
import 'package:shoes_store/features/shop/models/product_attribute_model.dart';
import 'package:shoes_store/features/shop/models/product_model.dart';
import 'package:shoes_store/features/shop/models/product_variation_model.dart';

import '../../routes/routes.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../repositories/brands/brand_repository.dart';

class AkDummyData {
  static final Logger logger = Logger();

  static Future<void> uploadDummyProducts() async {
    List<ProductModel> dummyProducts = [
      ProductModel(
        id: '001',
        title: 'Green Nike Sports Shoe',
        stock: 35,
        price: 120,
        isFeatured: true,
        thumbnail: AkImages.productImage1,
        description: 'Green Nike Sports Shoe',
        brand: BrandModel(
            id: '1',
            name: 'Nike',
            image: AkImages.nikeLogo,
            productsCount: 432,
            isFeatured: true),
        images: [
          AkImages.productImage1,
          AkImages.productImage2,
          AkImages.productImage3,
        ],
        salePrice: 30,
        sku: 'ABR4568',
        collectionId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            stock: 34,
            price: 120,
            salePrice: 112.6,
            image: AkImages.productImage1,
            description: 'This is a product description for green nike shoes',
            attributeValues: {'Color': 'Green', 'Size': 'EU34'},
          ),
          ProductVariationModel(
            id: '2',
            stock: 19,
            price: 150,
            salePrice: 140.6,
            image: AkImages.productImage3,
            description: 'This is a product description for green nike shoes',
            attributeValues: {'Color': 'Red', 'Size': 'EU32'},
          ),
          ProductVariationModel(
            id: '3',
            stock: 50,
            price: 200,
            salePrice: 182.0,
            image: AkImages.productImage3,
            description: 'This is a product description for green nike shoes',
            attributeValues: {'Color': 'Red', 'Size': 'EU34'},
          ),
        ],
        productType: ProductType.variable.toString(), // Use enum instead of string
      ),
      ProductModel(
        id: '002',
        title: 'High Air Jordan',
        stock: 15,
        price: 350,
        isFeatured: true,
        thumbnail: AkImages.productImage1,
        description: 'Description of High Air Jordan',
        brand: BrandModel(
          id: '2',
          name: 'Jordan',
          image: AkImages.jordanLogo,
          productsCount: 432,
        ),
        images: [
          AkImages.productImage1,
          AkImages.productImage2,
          AkImages.productImage3,
        ],
        salePrice: 300,
        sku: 'ABR4568',
        collectionId: '2',
        productAttributes: [
          ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
          ProductAttributeModel(name: 'Color', values: ['Blue', 'Black', 'RedBlack']),
        ],
        productType: ProductType.single.toString(), // Use enum instead of string
      ),
    ];

    try {
      // Loop through the products and upload them one by one
      await ProductRepository.instance.uploadDummyData(dummyProducts);
      

      // Log success message
      logger.i('Success: Products uploaded successfully');
    } catch (e) {
      // Log error message
      logger.e('Error: $e');
    }
  }

  static Future<void> uploadDummyBanners() async {
    final banners = [
      BannerModel(
          active: true,
          imageUrl: AkImages.homeBanner1,
          targetScreen: AkRoutes.home),
      BannerModel(
          active: true,
          imageUrl: AkImages.homeBanner2,
          targetScreen: AkRoutes.home),
      BannerModel(
          active: true,
          imageUrl: AkImages.homeBanner3,
          targetScreen: AkRoutes.home),
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
    final brands = [
      BrandModel(
        id: 'nike',
        name: 'Nike',
        image: 'assets/icons/brands/nike.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'adidas',
        name: 'Adidas',
        image: 'assets/icons/brands/adidas-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'puma',
        name: 'Puma',
        image: 'assets/icons/brands/puma-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'brooks',
        name: 'Brooks',
        image: 'assets/icons/brands/brooks-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'jordan',
        name: 'Jordan',
        image: 'assets/icons/brands/jordan-logo.png',
        isFeatured: true,
      ),
      BrandModel(
        id: 'crocs',
        name: 'Crocs',
        image: 'assets/icons/brands/crocs-logo.png',
        isFeatured: true,
      ),
    ];

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
      await BrandRepository.instance.uploadDummyData(brands);
      Get.snackbar('Success', 'Dummy brands uploaded successfully');

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

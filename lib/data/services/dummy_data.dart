import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../features/shop/models/banner_model.dart';
import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/collection_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';
import '../repositories/banners/banner_repository.dart';
import '../repositories/brands/brand_repository.dart';
import '../repositories/collections/collection_repository.dart';
import '../repositories/products/product_repository.dart';

class AkDummyData {
  static final Logger logger = Logger();

  static Future<void> uploadDummyProducts() async {
    List<ProductModel> dummyProducts = [
      // * Random
      // ProductModel(
      //   id: '001',
      //   title: 'Green Nike Sports Shoe',
      //   stock: 35,
      //   price: 120,
      //   isFeatured: true,
      //   thumbnail: AkImages.productImage1,
      //   description: 'Green Nike Sports Shoe',
      //   brand: BrandModel(
      //       id: '1',
      //       name: 'Nike',
      //       image: AkImages.nikeLogo,
      //       productsCount: 432,
      //       isFeatured: true),
      //   images: [
      //     AkImages.productImage1,
      //     AkImages.productImage2,
      //     AkImages.productImage3,
      //   ],
      //   salePrice: 30,
      //   sku: 'ABR4568',
      //   collectionId: '1',
      //   productAttributes: [
      //     ProductAttributeModel(
      //         name: 'Color', values: ['Green', 'Black', 'Red']),
      //     ProductAttributeModel(
      //         name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      //   ],
      //   productVariations: [
      //     ProductVariationModel(
      //       id: '1',
      //       stock: 34,
      //       price: 120,
      //       salePrice: 112.6,
      //       image: AkImages.productImage1,
      //       description: 'This is a product description for green nike shoes',
      //       attributeValues: {'Color': 'Green', 'Size': 'EU34'},
      //     ),
      //     ProductVariationModel(
      //       id: '2',
      //       stock: 19,
      //       price: 150,
      //       salePrice: 140.6,
      //       image: AkImages.productImage3,
      //       description: 'This is a product description for green nike shoes',
      //       attributeValues: {'Color': 'Red', 'Size': 'EU32'},
      //     ),
      //     ProductVariationModel(
      //       id: '3',
      //       stock: 50,
      //       price: 200,
      //       salePrice: 182.0,
      //       image: AkImages.productImage3,
      //       description: 'This is a product description for green nike shoes',
      //       attributeValues: {'Color': 'Red', 'Size': 'EU34'},
      //     ),
      //   ],
      //   productType:
      //       ProductType.variable.toString(), // Use enum instead of string
      // ),
      // ProductModel(
      //   id: '002',
      //   title: 'High Air Jordan',
      //   stock: 15,
      //   price: 350,
      //   isFeatured: true,
      //   thumbnail: AkImages.productImage1,
      //   description: 'Description of High Air Jordan',
      //   brand: BrandModel(
      //     id: '2',
      //     name: 'Jordan',
      //     image: AkImages.jordanLogo,
      //     productsCount: 432,
      //   ),
      //   images: [
      //     AkImages.productImage1,
      //     AkImages.productImage2,
      //     AkImages.productImage3,
      //   ],
      //   salePrice: 300,
      //   sku: 'ABR4568',
      //   collectionId: '2',
      //   productAttributes: [
      //     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
      //     ProductAttributeModel(
      //         name: 'Color', values: ['Blue', 'Black', 'RedBlack']),
      //   ],
      //   productType:
      //       ProductType.single.toString(), // Use enum instead of string
      // ),
      // * -- Jordan Products
      // ProductModel(
      //   id: '003',
      //   title: 'Nike Air Jordan 1',
      //   stock: 20,
      //   price: 320,
      //   isFeatured: true,
      //   thumbnail: AkImages.jordanProduct1Single,
      //   description: 'Classic Nike Air Jordan with a white and red design.',
      //   brand: BrandModel(
      //     id: '2',
      //     name: 'Jordan',
      //     image: AkImages.jordanLogo,
      //     productsCount: 432,
      //   ),
      //   images: [
      //     AkImages.jordanProduct1Single,
      //   ],
      //   salePrice: 280,
      //   sku: 'JRD001',
      //   collectionId: '3',
      //   productAttributes: [
      //     ProductAttributeModel(name: 'Size', values: ['EU32', 'EU34']),
      //   ],
      //   productType: ProductType.single.toString(),
      // ),
      // ProductModel(
      //   id: '004',
      //   title: 'Air Jordan 4 Retro Orchid',
      //   stock: 25,
      //   price: 340,
      //   isFeatured: true,
      //   thumbnail: AkImages.jordanProduct2Single,
      //   description: 'Air Jordan 4 Retro in orchid color.',
      //   brand: BrandModel(
      //     id: '2',
      //     name: 'Jordan',
      //     image: AkImages.jordanLogo,
      //     productsCount: 432,
      //   ),
      //   images: [
      //     AkImages.jordanProduct2Single,
      //   ],
      //   salePrice: 320,
      //   sku: 'JRD002',
      //   collectionId: '3',
      //   productAttributes: [
      //     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU36']),
      //   ],
      //   productType: ProductType.single.toString(),
      // ),
      // ProductModel(
      //   id: '005',
      //   title: 'Jordan Spizike Low',
      //   stock: 30,
      //   price: 250,
      //   isFeatured: true,
      //   thumbnail: AkImages.jordanProduct3,
      //   description: 'Jordan Spizike Low in brown and white design.',
      //   brand: BrandModel(
      //     id: '2',
      //     name: 'Jordan',
      //     image: AkImages.jordanLogo,
      //     productsCount: 432,
      //   ),
      //   images: [
      //     AkImages.jordanProduct3,
      //     AkImages.jordanProduct3Variation,
      //   ],
      //   salePrice: 220,
      //   sku: 'JRD003',
      //   collectionId: '3',
      //   productAttributes: [
      //     ProductAttributeModel(name: 'Color', values: ['Brown', 'Gym Red']),
      //     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU36']),
      //   ],
      //   productVariations: [
      //     ProductVariationModel(
      //       id: '1',
      //       stock: 10,
      //       price: 250,
      //       salePrice: 220,
      //       image: AkImages.jordanProduct3,
      //       description: 'Brown Jordan Spizike Low',
      //       attributeValues: {'Color': 'Brown', 'Size': 'EU34'},
      //     ),
      //     ProductVariationModel(
      //       id: '2',
      //       stock: 20,
      //       price: 250,
      //       salePrice: 230,
      //       image: AkImages.jordanProduct3Variation,
      //       description: 'Gym Red Jordan Spizike Low',
      //       attributeValues: {'Color': 'Gym Red', 'Size': 'EU36'},
      //     ),
      //   ],
      //   productType: ProductType.variable.toString(),
      // ),
      // ProductModel(
      //   id: '006',
      //   title: 'Nike Air Jordan Orange',
      //   stock: 40,
      //   price: 330,
      //   isFeatured: true,
      //   thumbnail: AkImages.jordanProduct4,
      //   description: 'Nike Air Jordan in a vibrant orange color.',
      //   brand: BrandModel(
      //     id: '2',
      //     name: 'Jordan',
      //     image: AkImages.jordanLogo,
      //     productsCount: 432,
      //   ),
      //   images: [
      //     AkImages.jordanProduct4,
      //     AkImages.jordanProduct4Variation1,
      //     AkImages.jordanProduct4Variation2,
      //   ],
      //   salePrice: 300,
      //   sku: 'JRD004',
      //   collectionId: '3',
      //   productAttributes: [
      //     ProductAttributeModel(
      //         name: 'Color',
      //         values: ['Orange', 'Black Red', 'White Red', 'Blue']),
      //     ProductAttributeModel(name: 'Size', values: ['EU34', 'EU36', 'EU38']),
      //   ],
      //   productVariations: [
      //     ProductVariationModel(
      //       id: '1',
      //       stock: 15,
      //       price: 330,
      //       salePrice: 300,
      //       image: AkImages.jordanProduct4,
      //       description: 'Orange Nike Air Jordan',
      //       attributeValues: {'Color': 'Orange', 'Size': 'EU34'},
      //     ),
      //     ProductVariationModel(
      //       id: '2',
      //       stock: 12,
      //       price: 330,
      //       salePrice: 305,
      //       image: AkImages.jordanProduct4Variation1,
      //       description: 'Black Red Nike Air Jordan',
      //       attributeValues: {'Color': 'Black Red', 'Size': 'EU36'},
      //     ),
      //     ProductVariationModel(
      //       id: '3',
      //       stock: 13,
      //       price: 330,
      //       salePrice: 310,
      //       image: AkImages.jordanProduct4Variation2,
      //       description: 'White Red Nike Air Jordan',
      //       attributeValues: {'Color': 'White Red', 'Size': 'EU38'},
      //     ),
      //   ],
      //   productType: ProductType.variable.toString(),
      // ),
      // * -- Nike Products
      // ProductModel(
      //   id: '007',
      //   title: 'Nike Sports Shoe Blue/Green',
      //   stock: 45,
      //   price: 140,
      //   isFeatured: true,
      //   thumbnail: AkImages.nikeProduct1,
      //   description: 'Nike Sports Shoe in blue and green.',
      //   brand: BrandModel(
      //     id: '1',
      //     name: 'Nike',
      //     image: AkImages.nikeLogo,
      //     productsCount: 450,
      //     isFeatured: true,
      //   ),
      //   images: [
      //     AkImages.nikeProduct1,
      //     AkImages.nikeProduct1Variation,
      //   ],
      //   salePrice: 120,
      //   sku: 'NKE001',
      //   collectionId: '1',
      //   productAttributes: [
      //     ProductAttributeModel(name: 'Color', values: ['Blue', 'Green']),
      //     ProductAttributeModel(name: 'Size', values: ['EU36', 'EU38', 'EU40']),
      //   ],
      //   productVariations: [
      //     ProductVariationModel(
      //       id: '1',
      //       stock: 20,
      //       price: 140,
      //       salePrice: 130,
      //       image: AkImages.nikeProduct1,
      //       description: 'Blue Nike Sports Shoe',
      //       attributeValues: {'Color': 'Blue', 'Size': 'EU36'},
      //     ),
      //     ProductVariationModel(
      //       id: '2',
      //       stock: 25,
      //       price: 140,
      //       salePrice: 125,
      //       image: AkImages.nikeProduct1Variation,
      //       description: 'Green Nike Sports Shoe',
      //       attributeValues: {'Color': 'Green', 'Size': 'EU38'},
      //     ),
      //   ],
      //   productType: ProductType.variable.toString(),
      // ),
      // ProductModel(
      //   id: '008',
      //   title: 'Nike Air Max SC White',
      //   stock: 30,
      //   price: 160,
      //   isFeatured: true,
      //   thumbnail: AkImages.nikeProduct2,
      //   description: 'Nike Air Max SC in white.',
      //   brand: BrandModel(
      //     id: '1',
      //     name: 'Nike',
      //     image: AkImages.nikeLogo,
      //     productsCount: 450,
      //     isFeatured: true,
      //   ),
      //   images: [
      //     AkImages.nikeProduct2,
      //     AkImages.nikeProduct2Variation1,
      //     AkImages.nikeProduct2Variation2,
      //   ],
      //   salePrice: 140,
      //   sku: 'NKE002',
      //   collectionId: '1',
      //   productAttributes: [
      //     ProductAttributeModel(
      //         name: 'Color', values: ['White', 'Black', 'Jade']),
      //     ProductAttributeModel(name: 'Size', values: ['EU38', 'EU40']),
      //   ],
      //   productVariations: [
      //     ProductVariationModel(
      //       id: '1',
      //       stock: 10,
      //       price: 160,
      //       salePrice: 150,
      //       image: AkImages.nikeProduct2,
      //       description: 'White Nike Air Max SC',
      //       attributeValues: {'Color': 'White', 'Size': 'EU38'},
      //     ),
      //     ProductVariationModel(
      //       id: '2',
      //       stock: 12,
      //       price: 160,
      //       salePrice: 145,
      //       image: AkImages.nikeProduct2Variation1,
      //       description: 'Jade Nike Air Max SC',
      //       attributeValues: {'Color': 'Jade', 'Size': 'EU40'},
      //     ),
      //     ProductVariationModel(
      //       id: '3',
      //       stock: 8,
      //       price: 160,
      //       salePrice: 142,
      //       image: AkImages.nikeProduct2Variation2,
      //       description: 'Black Nike Air Max SC',
      //       attributeValues: {'Color': 'Black', 'Size': 'EU38'},
      //     ),
      //   ],
      //   productType: ProductType.variable.toString(),
      // ),
      // ProductModel(
      //   id: '009',
      //   title: 'Nike Vaporfly 3 Multi-Color Pink',
      //   stock: 35,
      //   price: 220,
      //   isFeatured: true,
      //   thumbnail: AkImages.nikeProduct3,
      //   description: 'Nike Vaporfly 3 in pink multi-color.',
      //   brand: BrandModel(
      //     id: '1',
      //     name: 'Nike',
      //     image: AkImages.nikeLogo,
      //     productsCount: 450,
      //     isFeatured: true,
      //   ),
      //   images: [
      //     AkImages.nikeProduct3,
      //     AkImages.nikeProduct3Variation1,
      //     AkImages.nikeProduct3Variation2,
      //   ],
      //   salePrice: 210,
      //   sku: 'NKE003',
      //   collectionId: '1',
      //   productAttributes: [
      //     ProductAttributeModel(
      //         name: 'Color', values: ['Pink', 'Orange', 'Black']),
      //     ProductAttributeModel(name: 'Size', values: ['EU40', 'EU42']),
      //   ],
      //   productVariations: [
      //     ProductVariationModel(
      //       id: '1',
      //       stock: 15,
      //       price: 220,
      //       salePrice: 200,
      //       image: AkImages.nikeProduct3,
      //       description: 'Pink Nike Vaporfly 3',
      //       attributeValues: {'Color': 'Pink', 'Size': 'EU40'},
      //     ),
      //     ProductVariationModel(
      //       id: '2',
      //       stock: 10,
      //       price: 220,
      //       salePrice: 205,
      //       image: AkImages.nikeProduct3Variation1,
      //       description: 'Orange Nike Vaporfly 3',
      //       attributeValues: {'Color': 'Orange', 'Size': 'EU42'},
      //     ),
      //     ProductVariationModel(
      //       id: '3',
      //       stock: 10,
      //       price: 220,
      //       salePrice: 210,
      //       image: AkImages.nikeProduct3Variation2,
      //       description: 'Black Nike Vaporfly 3',
      //       attributeValues: {'Color': 'Black', 'Size': 'EU42'},
      //     ),
      //   ],
      //   productType: ProductType.variable.toString(),
      // ),
      // -- *
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

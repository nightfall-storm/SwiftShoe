import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../data/repositories/products/product_repository.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  // static final Logger _logger = Logger();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  get product => null;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Start loading
      isLoading.value = true;
      ('Fetching featured products...'); // Debug statement

      // Fetch products
      final products = await productRepository.getFeaturedProducts();
      // _logger.i('Featured products fetched: ${products.length}'); // Debug statement

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      // _logger.i('Error fetching products: $e'); // Debug statement
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Get the product price or price range for variations
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // Check if variations exist and if the product type is 'single'
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // If productVariations is null, return an appropriate message or value
      if (product.productVariations == null ||
          product.productVariations!.isEmpty) {
        return 'No variations available';
      }

      // Calculate the smallest and largest price range among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // Check if smallestPrice is equal to largestPrice
      if (smallestPrice == largestPrice) {
        return largestPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  // Calculate discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out Of Stock';
  }
}

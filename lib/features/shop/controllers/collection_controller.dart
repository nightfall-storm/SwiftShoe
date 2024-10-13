import 'package:get/get.dart';
import 'package:shoes_store/data/repositories/collections/collection_repository.dart';
import 'package:shoes_store/features/shop/models/collection_model.dart';
import 'package:shoes_store/utils/popups/loaders.dart';

class CollectionController extends GetxController {
  static CollectionController get instance => Get.find();

  final isLoading = false.obs;
  final _collectionRepository = Get.put(CollectionRepository());

  // Observable lists for collections
  RxList<CollectionModel> allCollections = <CollectionModel>[].obs;
  RxList<CollectionModel> featuredCollections = <CollectionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCollections(); // Fetch collections when controller is initialized
  }

  // Load collection data
  Future<void> fetchCollections() async {
    try {
      isLoading.value = true;

      // Fetch collections from data source
      final collections = await _collectionRepository.getAllCollections();

      // Update the Collections list
      allCollections.assignAll(collections);

      // Define the custom order
      List<String> customOrder = [
        'men',
        'women',
        'kids',
        'sports',
        'casual',
        'formal'
      ];

      // Sort collections based on the custom order
      allCollections.sort((a, b) {
        int aIndex = customOrder.indexOf(a.name.toLowerCase());
        int bIndex = customOrder.indexOf(b.name.toLowerCase());

        // If both collections are found in the custom order
        if (aIndex != -1 && bIndex != -1) {
          return aIndex.compareTo(bIndex);
        } else if (aIndex != -1) {
          return -1; // a comes first
        } else if (bIndex != -1) {
          return 1; // b comes first
        } else {
          return 0; // keep original order if neither is found
        }
      });

      // Filter featured Collections
      featuredCollections.assignAll(allCollections
          .where((collection) =>
              collection.isFeatured && collection.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      AkLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false; // Ensure loading state is updated
    }
  }
}

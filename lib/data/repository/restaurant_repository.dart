import '../../core/remote/api_service.dart';
import '../models/restaurant_model.dart';
import '../models/menu_item_model.dart';
import '../models/user_model.dart';
import '../models/promotional_banner_model.dart';

class RestaurantRepository {
  final ApiService _apiService = ApiService();

  // Restaurant methods
  Future<List<RestaurantModel>> getAllRestaurants() async {
    return await _apiService.getAllRestaurants();
  }

  Future<List<RestaurantModel>> getRestaurantsByCategory(
    String category,
  ) async {
    return await _apiService.getRestaurantsByCategory(category);
  }

  Future<List<RestaurantModel>> searchRestaurants({
    String? address,
    String? name,
  }) async {
    return await _apiService.searchRestaurants(address: address, name: name);
  }

  Future<RestaurantModel> getRestaurantById(int restaurantId) async {
    return await _apiService.getRestaurantById(restaurantId);
  }

  // Menu methods
  Future<List<MenuItemModel>> getRestaurantMenu(
    int restaurantId, {
    String? sortByPrice,
  }) async {
    return await _apiService.getRestaurantMenu(
      restaurantId,
      sortByPrice: sortByPrice,
    );
  }

  Future<List<MenuItemModel>> getAllItems({
    String? itemName,
    String? sortByPrice,
  }) async {
    return await _apiService.getAllItems(
      itemName: itemName,
      sortByPrice: sortByPrice,
    );
  }

  // Get best selling items (sorted by price descending)
  Future<List<MenuItemModel>> getBestSellingItems() async {
    return await _apiService.getAllItems();
  }

  // Get recommended items (you can customize this logic)
  Future<List<MenuItemModel>> getRecommendedItems() async {
    return await _apiService.getAllItems();
  }

  // Promotional Banner methods
  Future<List<PromotionalBannerModel>> getPromotionalBanners() async {
    try {
      return await _apiService.getPromotionalBanners();
    } catch (e) {
      // Return fallback data if API fails
      return PromotionalBannerItems.fallbackItems;
    }
  }

  // User methods
  Future<UserModel> getUserCode(String email, String password) async {
    return await _apiService.getUserCode(email, password);
  }

  Future<UserModel> registerUser(String email, String password) async {
    return await _apiService.registerUser(email, password);
  }
}

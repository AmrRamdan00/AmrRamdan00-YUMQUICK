import 'package:dio/dio.dart';
import 'api_constants.dart';
import '../../data/models/restaurant_model.dart';
import '../../data/models/menu_item_model.dart';
import '../../data/models/user_model.dart';
import '../../data/models/promotional_banner_model.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        error: true,
      ),
    );
  }

  Future<Response> get({required String path}) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

  Future<Response> post({required String path, required dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

  Future<Response> update({required String path, required dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

  Future<Response> delete({required String path}) async {
    try {
      return await _dio.delete(path);
    } on DioException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

  // Restaurant API Methods
  Future<List<RestaurantModel>> getAllRestaurants() async {
    try {
      final response = await _dio.get(ApiConstants.restaurants);
      final List<dynamic> data = response.data;
      return data.map((json) => RestaurantModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw e.message ?? "Failed to fetch restaurants";
    }
  }

  Future<List<RestaurantModel>> getRestaurantsByCategory(
    String category,
  ) async {
    try {
      final response = await _dio.get(
        ApiConstants.restaurants,
        queryParameters: {'category': category},
      );
      final List<dynamic> data = response.data;
      return data.map((json) => RestaurantModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw e.message ?? "Failed to fetch restaurants by category";
    }
  }

  Future<List<RestaurantModel>> searchRestaurants({
    String? address,
    String? name,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (address != null) queryParams['address'] = address;
      if (name != null) queryParams['name'] = name;

      final response = await _dio.get(
        ApiConstants.restaurants,
        queryParameters: queryParams,
      );
      final List<dynamic> data = response.data;
      return data.map((json) => RestaurantModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw e.message ?? "Failed to search restaurants";
    }
  }

  Future<RestaurantModel> getRestaurantById(int restaurantId) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.restaurantById}/$restaurantId',
      );
      return RestaurantModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.message ?? "Failed to fetch restaurant";
    }
  }

  Future<List<MenuItemModel>> getRestaurantMenu(
    int restaurantId, {
    String? sortByPrice,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (sortByPrice != null) queryParams['sortbyprice'] = sortByPrice;

      final response = await _dio.get(
        '${ApiConstants.restaurantMenu}/$restaurantId/menu',
        queryParameters: queryParams,
      );
      final List<dynamic> data = response.data;
      return data.map((json) => MenuItemModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw e.message ?? "Failed to fetch restaurant menu";
    }
  }

  Future<List<MenuItemModel>> getAllItems({
    String? itemName,
    String? sortByPrice,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (itemName != null) queryParams['ItemName'] = itemName;
      // Temporarily disable sorting to test basic functionality
      // if (sortByPrice != null) queryParams['sortbyprice'] = sortByPrice;

      final response = await _dio.get(
        ApiConstants.allItems,
        queryParameters: queryParams,
      );

      final List<dynamic> data = response.data;
      final items = data.map((json) => MenuItemModel.fromJson(json)).toList();

      return items;
    } on DioException catch (e) {
      throw e.message ?? "Failed to fetch items";
    }
  }

  // Promotional Banner API Methods
  Future<List<PromotionalBannerModel>> getPromotionalBanners() async {
    try {
      final response = await _dio.get(ApiConstants.promotionalBanners);
      final List<dynamic> data = response.data;
      return data.map((json) => PromotionalBannerModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw e.message ?? "Failed to fetch promotional banners";
    }
  }

  // User API Methods - Updated to work with actual API
  Future<UserModel> getUserCode(String email, String password) async {
    try {
      // Get all users and find matching credentials
      final response = await _dio.get(ApiConstants.getUserCode);
      final List<dynamic> users = response.data;

      // Find user with matching email and password
      for (var userData in users) {
        if (userData['userEmail'] == email &&
            userData['password'] == password) {
          return UserModel.fromJson(userData);
        }
      }

      // If no user found, throw an error
      throw Exception('Invalid email or password');
    } on DioException catch (e) {
      throw e.message ?? "Failed to authenticate user";
    }
  }

  Future<UserModel> registerUser(String email, String password) async {
    try {
      // Check if user already exists
      final response = await _dio.get(ApiConstants.registerUser);
      final List<dynamic> users = response.data;

      // Check if email already exists
      for (var userData in users) {
        if (userData['userEmail'] == email) {
          throw Exception('User with this email already exists');
        }
      }

      // Since this is a fake API, we'll simulate successful registration
      // In a real app, you would POST to create a new user
      final newUser = {
        'userEmail': email,
        'password': password,
        'usercode': 'generated-${DateTime.now().millisecondsSinceEpoch}',
      };

      return UserModel.fromJson(newUser);
    } on DioException catch (e) {
      throw e.message ?? "Failed to register user";
    }
  }
}

// "CRUD operations"
// Read --> GET
// Update --> (put - patch)
// Create --> POST
// Delete --> DELETE

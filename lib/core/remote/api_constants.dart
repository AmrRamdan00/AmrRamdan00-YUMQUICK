class ApiConstants {
  static const String baseUrl = 'https://fakerestaurantapi.runasp.net/api';

  // Restaurant endpoints
  static const String restaurants = '/Restaurant';
  static const String restaurantById = '/Restaurant';
  static const String restaurantMenu = '/Restaurant';
  static const String allItems = '/Restaurant/items';

  // User endpoints - Updated to match actual API
  static const String users = '/User';
  static const String getUserCode = '/User'; // Changed from '/User/getusercode'
  static const String registerUser = '/User'; // Changed from '/User/register'

  // Promotional Banner endpoints
  static const String promotionalBanners = '/PromotionalBanner';

  // Order endpoints
  static const String orders = '/Order';
  static const String makeOrder = '/Order';
}

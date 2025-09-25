import '../models/menu_item_model.dart';

class CategoryFilterService {
  static List<MenuItemModel> filterByCategory(
    List<MenuItemModel> items,
    String? category,
  ) {
    if (category == null) return items;

    return items.where((item) {
      final itemName = item.itemName.toLowerCase();
      final itemDescription = item.itemDescription.toLowerCase();
      final categoryLower = category.toLowerCase();

      return _matchesCategory(itemName, itemDescription, categoryLower);
    }).toList();
  }

  static bool _matchesCategory(
    String itemName,
    String itemDescription,
    String category,
  ) {
    switch (category) {
      case 'snacks':
        return _matchesSnacks(itemName, itemDescription);
      case 'meal':
        return _matchesMeals(itemName, itemDescription);
      case 'vegan':
        return _matchesVegan(itemName, itemDescription);
      case 'dessert':
        return _matchesDesserts(itemName, itemDescription);
      case 'drinks':
        return _matchesDrinks(itemName, itemDescription);
      default:
        return true; // Show all items if category not recognized
    }
  }

  static bool _matchesSnacks(String itemName, String itemDescription) {
    final snackKeywords = [
      'snack',
      'samosa',
      'pakora',
      'vada',
      'biscuit',
      'cracker',
      'chaat',
      'bhel',
      'sev',
      'namkeen',
      'fritter',
    ];
    return _containsAnyKeyword(itemName, itemDescription, snackKeywords);
  }

  static bool _matchesMeals(String itemName, String itemDescription) {
    final mealKeywords = [
      'biryani',
      'curry',
      'rice',
      'dal',
      'roti',
      'naan',
      'thali',
      'chicken',
      'mutton',
      'fish',
      'prawn',
      'paneer',
      'vegetable',
      'main course',
      'meal',
      'gravy',
      'masala',
      'tikka',
      'kebab',
      'pulao',
      'fried rice',
      'steamed rice',
    ];
    return _containsAnyKeyword(itemName, itemDescription, mealKeywords);
  }

  static bool _matchesVegan(String itemName, String itemDescription) {
    final veganKeywords = [
      'vegetable',
      'dal',
      'rice',
      'paneer',
      'tofu',
      'vegetarian',
      'vegan',
      'plant',
      'green',
      'leafy',
      'sabzi',
      'bhaji',
    ];
    return _containsAnyKeyword(itemName, itemDescription, veganKeywords);
  }

  static bool _matchesDesserts(String itemName, String itemDescription) {
    final dessertKeywords = [
      'sweet',
      'dessert',
      'cake',
      'kulfi',
      'ice cream',
      'gulab',
      'rasgulla',
      'sandesh',
      'barfi',
      'laddu',
      'halwa',
      'payasam',
      'firni',
      'tiramisu',
      'pastry',
      'cookie',
      'biscuit',
      'muffin',
      'pudding',
      'custard',
      'jelly',
      'mousse',
      'cheesecake',
    ];
    return _containsAnyKeyword(itemName, itemDescription, dessertKeywords);
  }

  static bool _matchesDrinks(String itemName, String itemDescription) {
    final drinkKeywords = [
      'coffee',
      'tea',
      'juice',
      'lassi',
      'smoothie',
      'shake',
      'water',
      'soda',
      'beer',
      'wine',
      'beverage',
      'drink',
      'mocktail',
      'cocktail',
      'lemonade',
      'squash',
      'syrup',
      'milk',
      'buttermilk',
      'chai',
      'latte',
      'cappuccino',
    ];
    return _containsAnyKeyword(itemName, itemDescription, drinkKeywords);
  }

  static bool _containsAnyKeyword(
    String itemName,
    String itemDescription,
    List<String> keywords,
  ) {
    return keywords.any(
      (keyword) =>
          itemName.contains(keyword) || itemDescription.contains(keyword),
    );
  }

  // Get available categories
  static List<String> getAvailableCategories() {
    return ['snacks', 'meal', 'vegan', 'dessert', 'drinks'];
  }

  // Get category display name
  static String getCategoryDisplayName(String category) {
    switch (category.toLowerCase()) {
      case 'snacks':
        return 'Snacks';
      case 'meal':
        return 'Meals';
      case 'vegan':
        return 'Vegan';
      case 'dessert':
        return 'Desserts';
      case 'drinks':
        return 'Drinks';
      default:
        return category;
    }
  }
}

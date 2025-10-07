import '../models/ingredient_addon_model.dart';

class AddonService {
  static List<IngredientAddon> getAddonsForCategory(String categoryId) {
    switch (categoryId.toLowerCase()) {
      case 'meal':
        return const [
          IngredientAddon(id: 'shrimp', name: 'Shrimp', price: 2.99),
          IngredientAddon(id: 'onion', name: 'Crisp Onion', price: 3.99),
          IngredientAddon(id: 'corn', name: 'Sweet Corn', price: 3.99),
          IngredientAddon(id: 'pico', name: 'Pico de Gallo', price: 2.99),
        ];
      case 'snacks':
        return const [
          IngredientAddon(id: 'cheese', name: 'Extra Cheese', price: 1.49),
          IngredientAddon(id: 'sauce', name: 'Spicy Sauce', price: 0.99),
        ];
      case 'dessert':
        return const [
          IngredientAddon(id: 'choco', name: 'Chocolate Syrup', price: 0.79),
          IngredientAddon(id: 'nuts', name: 'Crushed Nuts', price: 0.99),
        ];
      case 'drinks':
        return const [
          IngredientAddon(id: 'ice', name: 'Extra Ice', price: 0.0),
          IngredientAddon(id: 'lemon', name: 'Lemon Slice', price: 0.49),
        ];
      case 'vegan':
        return const [
          IngredientAddon(id: 'tofu', name: 'Tofu Cubes', price: 1.99),
          IngredientAddon(id: 'greens', name: 'Extra Greens', price: 1.49),
        ];
      default:
        return const [];
    }
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/main_navigation/main_navigation_screen.dart';
import '../../../../data/models/menu_item_model.dart';
import '../../../widgets/app_navigation_bar.dart';
import '../widgets/food_card_widgets/food_card_widgets.dart';

/// Clean, modular food card screen using custom widgets
class FoodCardScreen extends StatelessWidget {
  final MenuItemModel item;
  final String categoryId;

  const FoodCardScreen({
    super.key,
    required this.item,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const FoodCardBackground(),
          SafeArea(
            child: Column(
              children: [
                // Fixed header
                FoodCardHeader(title: item.itemName),
                const SizedBox(height: 16),
                // Scrollable content area
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // Item image
                        FoodCardImage(
                          imageUrl: item.imageUrl,
                          itemName: item.itemName,
                        ),
                        const SizedBox(height: 20),
                        // Price and quantity section with divider
                        FoodCardPriceSection(itemPrice: item.itemPrice),
                        const SizedBox(height: 18),
                        // Food details and ingredients
                        FoodCardDetails(
                          itemName: item.itemName,
                          itemDescription: item.itemDescription,
                          categoryId: categoryId,
                        ),
                        const SizedBox(height: 8),
                        // Add to cart button
                        FoodCardActions(itemName: item.itemName),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        child: AppNavigationBar(
          currentIndex: 1, // Menu tab
          onTap: (index) {
            if (index == 0) {
              // Home - replace with main navigation screen showing home tab
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(),
                  settings: const RouteSettings(arguments: 0), // Home tab index
                ),
                (route) => false, // Remove all previous routes
              );
            } else if (index == 1) {
              // Menu - just pop back to menu screen
              Navigator.of(context).pop();
            } else {
              // Other tabs - replace with main navigation screen showing selected tab
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const MainNavigationScreen(),
                  settings: RouteSettings(
                    arguments: index,
                  ), // Selected tab index
                ),
                (route) => false, // Remove all previous routes
              );
            }
          },
        ),
      ),
    );
  }
}

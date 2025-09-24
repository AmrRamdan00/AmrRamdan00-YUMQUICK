import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_assets.dart';

class FoodCategories extends StatelessWidget {
  const FoodCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Snacks', 'icon': AppAssets.snackIcon},
      {'name': 'Meal', 'icon': AppAssets.mealIcon},
      {'name': 'Vegan', 'icon': AppAssets.veganIcon},
      {'name': 'Dessert', 'icon': AppAssets.dessertIcon},
      {'name': 'Drinks', 'icon': AppAssets.drinkIcon},
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: categories.map((category) {
              return _buildCategoryItem(
                category['name'] as String,
                category['icon'] as String,
              );
            }).toList(),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 1,
          color: AppColors.orangeBase.withOpacity(0.3),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String name, String iconPath) {
    return GestureDetector(
      onTap: () {
        // TODO: Handle category selection
        print('Selected category: $name');
      },
      child: Column(
        children: [
          Container(
            width: 53,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.yellow2,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Center(
              child: SvgPicture.asset(iconPath, width: 42, height: 42),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppTheme.agParagraph.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.font,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_assets.dart';

class FoodCategories extends StatelessWidget {
  final Function(String)? onCategorySelected;
  final String? selectedCategory;

  const FoodCategories({
    super.key,
    this.onCategorySelected,
    this.selectedCategory,
  });

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
    final isSelected = selectedCategory?.toLowerCase() == name.toLowerCase();

    return GestureDetector(
      onTap: () {
        if (onCategorySelected != null) {
          onCategorySelected!(name.toLowerCase());
        }
        print('Selected category: $name');
      },
      child: Column(
        children: [
          Container(
            width: isSelected ? 65 : 53, // Bigger when selected
            height: isSelected ? 76 : 64, // Bigger when selected
            decoration: BoxDecoration(
              color: isSelected ? AppColors.white : AppColors.yellow2,
              borderRadius: BorderRadius.circular(35),
              border: isSelected
                  ? Border.all(color: AppColors.yellowBase, width: 3)
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.orangeBase.withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: isSelected ? 48 : 42, // Bigger icon when selected
                height: isSelected ? 48 : 42, // Bigger icon when selected
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppTheme.agParagraph.copyWith(
              fontSize: isSelected ? 14 : 12, // Bigger text when selected
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? AppColors.white : AppColors.font,
            ),
          ),
        ],
      ),
    );
  }
}

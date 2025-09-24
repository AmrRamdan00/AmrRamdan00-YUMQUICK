import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/menu_item_model.dart';
import 'food_card.dart';

class FoodSection extends StatelessWidget {
  final String title;
  final List<MenuItemModel> items;
  final bool showRating;
  final VoidCallback? onViewAllTap;
  final Function(MenuItemModel)? onItemTap;
  final Function(MenuItemModel)? onFavoriteTap;

  const FoodSection({
    super.key,
    required this.title,
    required this.items,
    this.showRating = false,
    this.onViewAllTap,
    this.onItemTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTheme.agTitle.copyWith(fontSize: 20)),
              if (onViewAllTap != null)
                GestureDetector(
                  onTap: onViewAllTap,
                  child: Text(
                    'View All >',
                    style: AppTheme.agParagraph.copyWith(
                      color: AppColors.orangeBase,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Food items list
          SizedBox(
            height: 200,
            child: items.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return FoodCard(
                        item: item,
                        showRating: showRating,
                        onTap: () => onItemTap?.call(item),
                        onFavoriteTap: () => onFavoriteTap?.call(item),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 48,
            color: AppColors.orangeBase.withOpacity(0.5),
          ),
          const SizedBox(height: 8),
          Text(
            'No items available',
            style: AppTheme.agParagraph.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}

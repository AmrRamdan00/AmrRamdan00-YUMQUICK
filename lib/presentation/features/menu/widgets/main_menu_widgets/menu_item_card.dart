import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../../data/models/menu_item_model.dart';
import '../../../../../core/theme/app_colors.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItemModel item;
  final VoidCallback? onTap;

  const MenuItemCard({super.key, required this.item, this.onTap});

  // Generate realistic rating between 3.5 and 5.0
  String _getRandomRating() {
    final random = Random(
      item.itemID,
    ); // Use itemID as seed for consistent ratings
    final rating = 3.5 + (random.nextDouble() * 1.5); // Range: 3.5 to 5.0
    return rating.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Large Image
            Container(
              width: 323,
              height: 174,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: AppColors.lightGrey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                        color: AppColors.orangeBase,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightGrey,
                      child: const Icon(
                        Icons.restaurant,
                        size: 60,
                        color: AppColors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Name, Rating, and Price Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Item Name with orange dot - takes flexible space
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          item.itemName,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.0, // line-height: 100%
                            letterSpacing: 0.0, // letter-spacing: 0%
                            color: AppColors.font,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Orange dot - fixed width with constraint
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.orangeBase,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                // Rating - fixed width
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orangeBase,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _getRandomRating(), // Generate realistic rating
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Color(0xFFF4BA1B),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Price - fixed width
                Text(
                  '\$${item.itemPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.0, // line-height: 100%
                    letterSpacing: 0.0, // letter-spacing: 0%
                    color: AppColors.orangeBase,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              item.itemDescription,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.0, // line-height: 100%
                letterSpacing: 0.0, // letter-spacing: 0%
                color: AppColors.grey,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            // Line below description
            Container(height: 1, color: const Color(0xFFFFD8C7)),
          ],
        ),
      ),
    );
  }
}

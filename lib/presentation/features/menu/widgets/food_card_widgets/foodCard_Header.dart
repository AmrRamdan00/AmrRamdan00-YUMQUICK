import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/theme/app_colors.dart';

class FoodCardHeader extends StatelessWidget {
  final String title;
  final String rating;

  const FoodCardHeader({super.key, required this.title, this.rating = '5.0'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top row with back button, title, dot, and favorite button
          Row(
            children: [
              // Back button
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: AppColors.orangeBase,
                ),
              ),

              // Title and dot
              Expanded(
                child: Row(
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
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

              const SizedBox(width: 12),

              // Favorite button
              _FavoriteButton(),
            ],
          ),

          // Rating chip below
          Transform.translate(
            offset: const Offset(0, -7),
            child: Padding(
              padding: const EdgeInsets.only(left: 45),
              child: _RatingChip(ratingText: rating),
            ),
          ),
        ],
      ),
    );
  }
}

// Internal favorite button widget
class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton();

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  bool _isFavorite = false;
  bool _pressed = false;

  void _handleTap() {
    HapticFeedback.selectionClick();
    setState(() => _isFavorite = !_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 90),
        scale: _pressed ? 0.92 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            color: AppColors.orangeBase,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

// Internal rating chip widget
class _RatingChip extends StatelessWidget {
  final String ratingText;
  const _RatingChip({required this.ratingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.orangeBase,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ratingText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.star, size: 16, color: Color(0xFFF4BA1B)),
        ],
      ),
    );
  }
}

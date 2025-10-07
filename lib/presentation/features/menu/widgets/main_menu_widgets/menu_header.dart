import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_assets.dart';

class MenuHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onProfileTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onNotificationTap;

  const MenuHeader({
    super.key,
    required this.title,
    this.onSearchTap,
    this.onFilterTap,
    this.onProfileTap,
    this.onCartTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top row with title and user icons
          Row(
            children: [
              Text(
                title,
                style: AppTheme.agTitle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.font,
                ),
              ),
              const Spacer(),
              // User profile icons
              Row(
                children: [
                  _buildIconButton(
                    icon: AppAssets.profileIcon,
                    onTap: onProfileTap,
                  ),
                  const SizedBox(width: 8),
                  _buildIconButton(icon: AppAssets.cartIcon, onTap: onCartTap),
                  const SizedBox(width: 8),
                  _buildIconButton(
                    icon: AppAssets.notificationIcon,
                    onTap: onNotificationTap,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Search bar
          GestureDetector(
            onTap: onSearchTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.grey, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Search',
                      style: AppTheme.agParagraph.copyWith(
                        color: AppColors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onFilterTap,
                    child: const Icon(
                      Icons.filter_list,
                      color: AppColors.grey,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({required String icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(
          icon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
      ),
    );
  }
}

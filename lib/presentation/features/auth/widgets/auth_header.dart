import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const AuthHeader({super.key, required this.title, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: onBackPressed ?? () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: AppColors.orangeBase,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

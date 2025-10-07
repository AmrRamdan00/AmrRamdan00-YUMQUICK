import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: AppColors.yellowBase,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 64, color: AppColors.orangeBase),
            SizedBox(height: 16),
            Text(
              'Favorites Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.font,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This is where favorite items will be displayed',
              style: TextStyle(fontSize: 16, color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

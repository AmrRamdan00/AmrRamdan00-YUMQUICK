import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('YUMQUICK'),
        backgroundColor: AppColors.yellowBase,
        foregroundColor: AppColors.font,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to YUMQUICK!',
              style: AppTheme.agTitle.copyWith(color: AppColors.orangeBase),
            ),
            const SizedBox(height: 20),
            Text(
              'Your delicious food delivery app',
              style: AppTheme.agParagraph,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: AppTheme.primaryButtonStyle,
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Support'),
        backgroundColor: AppColors.yellowBase,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.headset_mic, size: 64, color: AppColors.orangeBase),
            SizedBox(height: 16),
            Text(
              'Support Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.font,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This is where customer support features will be displayed',
              style: TextStyle(fontSize: 16, color: AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

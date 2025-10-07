import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class FoodCardBackground extends StatelessWidget {
  const FoodCardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Yellow header background
        Container(height: 230, color: const Color(0xFFF5C953)),

        // White body background with rounded top
        Positioned(
          left: 0,
          right: 0,
          top: 163,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

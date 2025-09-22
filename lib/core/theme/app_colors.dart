import 'package:flutter/material.dart';

class AppColors {
  static const Color yellowBase = Color(0xFFF5CB58);
  static const Color yellow2 = Color(0xFFF3E9B5);

  static const Color orangeBase = Color(0xFFE95322);
  static const Color orange2 = Color(0xFFFFA500);

  static const Color font = Color(0xFF391713);
  static const Color font2 = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF808080);
  static const Color lightGrey = Color(0xFFF5F5F5);

  static const Color backgroundYellow = yellowBase;
  static const Color backgroundOrange = orangeBase;

  static const Color buttonYellow = yellowBase;
  static const Color buttonOrange = orangeBase;
  static const Color buttonTextOrange = orangeBase;
  static const Color buttonTextYellow = yellowBase;

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  static const LinearGradient yellowGradient = LinearGradient(
    colors: [yellowBase, yellow2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [orangeBase, orange2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

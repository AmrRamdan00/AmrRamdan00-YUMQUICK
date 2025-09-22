import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppTheme {
  static const TextStyle agTitleScreen = TextStyle(
    fontFamily: 'LeagueSpartan',
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.font,
    letterSpacing: 0.5,
  );

  static const TextStyle agTitle = TextStyle(
    fontFamily: 'LeagueSpartan',
    fontSize: 24,
    height: 26 / 24,
    fontWeight: FontWeight.bold,
    color: AppColors.font,
    letterSpacing: 0.3,
  );

  static const TextStyle agSubtitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.font,
    letterSpacing: 0.2,
  );

  static const TextStyle agParagraph = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    height: 14 / 14,
    fontWeight: FontWeight.normal,
    color: AppColors.font,
    letterSpacing: 0.1,
  );

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.yellowBase,
    foregroundColor: AppColors.orangeBase,
    elevation: 2,
    shadowColor: AppColors.font.withValues(alpha: 0.3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    textStyle: const TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.yellow2,
    foregroundColor: AppColors.orangeBase,
    elevation: 1,
    shadowColor: AppColors.font.withValues(alpha: 0.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    textStyle: const TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  static ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: AppColors.orangeBase,
    side: const BorderSide(color: AppColors.orangeBase, width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    textStyle: const TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  static CardThemeData cardTheme = CardThemeData(
    elevation: 4,
    shadowColor: AppColors.font.withValues(alpha: 0.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: AppColors.white,
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.lightGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.orangeBase, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    hintStyle: const TextStyle(
      fontFamily: 'Inter',
      color: AppColors.grey,
      fontSize: 14,
    ),
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: AppColors.yellowBase,
    foregroundColor: AppColors.font,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: 'LeagueSpartan',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.font,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  static FloatingActionButtonThemeData floatingActionButtonTheme =
      const FloatingActionButtonThemeData(
        backgroundColor: AppColors.orangeBase,
        foregroundColor: AppColors.white,
        elevation: 4,
      );

  static BottomNavigationBarThemeData bottomNavigationBarTheme =
      const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.orangeBase,
        unselectedItemColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.orangeBase,
        secondary: AppColors.yellowBase,
        surface: AppColors.white,
        background: AppColors.white,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.font,
        onSurface: AppColors.font,
        onBackground: AppColors.font,
        onError: AppColors.white,
      ),
      textTheme: const TextTheme(
        displayLarge: agTitleScreen,
        displayMedium: agTitleScreen,
        displaySmall: agTitleScreen,
        headlineLarge: agTitle,
        headlineMedium: agTitle,
        headlineSmall: agTitle,
        titleLarge: agSubtitle,
        titleMedium: agSubtitle,
        titleSmall: agSubtitle,
        bodyLarge: agParagraph,
        bodyMedium: agParagraph,
        bodySmall: agParagraph,
        labelLarge: agParagraph,
        labelMedium: agParagraph,
        labelSmall: agParagraph,
      ),
      appBarTheme: appBarTheme,
      cardTheme: cardTheme,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
      floatingActionButtonTheme: floatingActionButtonTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      scaffoldBackgroundColor: AppColors.white,
    );
  }
}

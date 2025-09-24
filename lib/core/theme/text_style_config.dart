import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Configuration class for customizable text styles
class TextStyleConfig {
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final double? height;
  final TextDecoration? decoration;

  const TextStyleConfig({
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.height,
    this.decoration,
  });

  /// Default configuration using League Spartan
  static const TextStyleConfig defaultConfig = TextStyleConfig(
    fontFamily: 'LeagueSpartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.font,
    letterSpacing: 0.1,
  );

  /// Create a TextStyle from this configuration
  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: fontFamily ?? defaultConfig.fontFamily,
      fontSize: fontSize ?? defaultConfig.fontSize,
      fontWeight: fontWeight ?? defaultConfig.fontWeight,
      color: color ?? defaultConfig.color,
      letterSpacing: letterSpacing ?? defaultConfig.letterSpacing,
      height: height ?? defaultConfig.height,
      decoration: decoration ?? defaultConfig.decoration,
    );
  }

  /// Merge this configuration with another
  TextStyleConfig merge(TextStyleConfig? other) {
    if (other == null) return this;

    return TextStyleConfig(
      fontFamily: other.fontFamily ?? fontFamily,
      fontSize: other.fontSize ?? fontSize,
      fontWeight: other.fontWeight ?? fontWeight,
      color: other.color ?? color,
      letterSpacing: other.letterSpacing ?? letterSpacing,
      height: other.height ?? height,
      decoration: other.decoration ?? decoration,
    );
  }

  /// Copy this configuration with overrides
  TextStyleConfig copyWith({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyleConfig(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      height: height ?? this.height,
      decoration: decoration ?? this.decoration,
    );
  }
}

/// Predefined text style configurations for common use cases
class AppTextStyles {
  // Label styles
  static const TextStyleConfig labelSmall = TextStyleConfig(
    fontFamily: 'LeagueSpartan',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.font,
    letterSpacing: 0.1,
  );

  static const TextStyleConfig labelMedium = TextStyleConfig(
    fontFamily: 'LeagueSpartan',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.font,
    letterSpacing: 0.1,
  );

  static const TextStyleConfig labelLarge = TextStyleConfig(
    fontFamily: 'LeagueSpartan',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.font,
    letterSpacing: 0.1,
  );

  // Input text styles
  static const TextStyleConfig inputText = TextStyleConfig(
    fontFamily: 'LeagueSpartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.font,
    letterSpacing: 0.1,
  );

  static const TextStyleConfig inputHint = TextStyleConfig(
    fontFamily: 'LeagueSpartan',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
    letterSpacing: 0.1,
  );

  // Error text style
  static const TextStyleConfig errorText = TextStyleConfig(
    fontFamily: 'LeagueSpartan',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.error,
    letterSpacing: 0.1,
  );
}

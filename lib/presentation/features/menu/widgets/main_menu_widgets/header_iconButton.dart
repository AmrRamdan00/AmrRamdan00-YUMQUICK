import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class HeaderIconButton extends StatelessWidget {
  final dynamic icon;
  final double? size;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const HeaderIconButton({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: icon is IconData
          ? Icon(icon, size: size ?? 20, color: color ?? AppColors.font)
          : icon,
    );
  }
}

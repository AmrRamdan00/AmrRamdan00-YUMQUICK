import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../presentation/widgets/app_button.dart';

class AuthSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const AuthSubmitButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.textStyle,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Center(
        child: AppButton(
          text: text,
          textStyle:
              textStyle ??
              const TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
          width: width ?? 207,
          height: height ?? 45,
          onPressed: onPressed,
          isLoading: isLoading,
        ),
      ),
    );
  }
}

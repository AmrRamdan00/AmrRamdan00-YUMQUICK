import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AuthFooter extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onActionPressed;

  const AuthFooter({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onActionPressed,
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
            children: [
              TextSpan(text: questionText),
              TextSpan(
                text: actionText,
                style: const TextStyle(
                  fontFamily: 'League Spartan',
                  color: AppColors.orangeBase,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

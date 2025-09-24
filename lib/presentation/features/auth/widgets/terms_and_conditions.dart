import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TermsAndConditions extends StatelessWidget {
  final VoidCallback? onTermsPressed;
  final VoidCallback? onPrivacyPressed;

  const TermsAndConditions({
    super.key,
    this.onTermsPressed,
    this.onPrivacyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.grey,
          ),
          children: [
            const TextSpan(text: 'By continuing, you agree to\n '),
            WidgetSpan(
              child: GestureDetector(
                onTap: onTermsPressed,
                child: const Text(
                  'Terms of Use',
                  style: TextStyle(
                    color: AppColors.orangeBase,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const TextSpan(text: ' and '),
            WidgetSpan(
              child: GestureDetector(
                onTap: onPrivacyPressed,
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: AppColors.orangeBase,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

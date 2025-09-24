import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;
  final String dividerText;

  const SocialLoginButtons({
    super.key,
    this.onGooglePressed,
    this.onFacebookPressed,
    this.dividerText = 'or',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Center(
          child: Text(
            dividerText,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onGooglePressed ?? () {},
                icon: SvgPicture.asset(AppAssets.googleLogo),
              ),
              IconButton(
                onPressed: onFacebookPressed ?? () {},
                icon: SvgPicture.asset(AppAssets.facebookLogo),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

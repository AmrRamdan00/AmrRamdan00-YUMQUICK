import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../widgets/app_button.dart';

class FoodCardActions extends StatelessWidget {
  final VoidCallback? onAddToCart;
  final String itemName;

  const FoodCardActions({super.key, this.onAddToCart, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppButton(
          text: 'Add to Cart',
          width: 200,
          height: 40,
          onPressed: onAddToCart ?? () => _defaultAddToCart(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.cartIcon2, width: 22, height: 22),
              const SizedBox(width: 12),
              const Text(
                'Add to Cart',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _defaultAddToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.success,
        content: Text('$itemName added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

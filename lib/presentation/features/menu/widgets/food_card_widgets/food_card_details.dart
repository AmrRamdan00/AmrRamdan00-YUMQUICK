import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../data/models/ingredient_addon_model.dart';
import '../../../../../data/services/addon_service.dart';

class FoodCardDetails extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final String categoryId;

  const FoodCardDetails({
    super.key,
    required this.itemName,
    required this.itemDescription,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food title and description section
          Text(
            itemName,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.font,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            itemDescription.isNotEmpty
                ? itemDescription
                : 'Delicious ${itemName.toLowerCase()} prepared with fresh ingredients and served with care.',
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          // Add on ingredients section
          AddOnIngredients(categoryId: categoryId),
        ],
      ),
    );
  }
}

class AddOnIngredients extends StatefulWidget {
  final String categoryId;

  const AddOnIngredients({super.key, required this.categoryId});

  @override
  State<AddOnIngredients> createState() => _AddOnIngredientsState();
}

class _AddOnIngredientsState extends State<AddOnIngredients> {
  final Set<String> _selectedAddons = {};

  @override
  Widget build(BuildContext context) {
    final addons = AddonService.getAddonsForCategory(widget.categoryId);

    if (addons.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add on ingredients',
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.font,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        ...addons.map(
          (addon) => IngredientItem(
            addon: addon,
            isSelected: _selectedAddons.contains(addon.id),
            onToggle: (isSelected) {
              setState(() {
                if (isSelected) {
                  _selectedAddons.add(addon.id);
                } else {
                  _selectedAddons.remove(addon.id);
                }
              });
            },
          ),
        ),
      ],
    );
  }
}

class IngredientItem extends StatefulWidget {
  final IngredientAddon addon;
  final bool isSelected;
  final Function(bool) onToggle;

  const IngredientItem({
    super.key,
    required this.addon,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  State<IngredientItem> createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  bool _pressed = false;

  void _handleToggle() {
    HapticFeedback.selectionClick();
    widget.onToggle(!widget.isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Ingredient name
          Text(
            widget.addon.name,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: AppColors.font,
              height: 1.3,
            ),
          ),
          const SizedBox(width: 8),
          // Dotted line
          Expanded(
            child: CustomPaint(
              painter: DottedLinePainter(),
              size: const Size(double.infinity, 1),
            ),
          ),
          const SizedBox(width: 8),
          // Price and toggle button
          Row(
            children: [
              Text(
                '\$${widget.addon.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.font,
                  height: 1.3,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: _handleToggle,
                onTapDown: (_) => setState(() => _pressed = true),
                onTapUp: (_) => setState(() => _pressed = false),
                onTapCancel: () => setState(() => _pressed = false),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 90),
                  scale: _pressed ? 0.92 : 1.0,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset(
                      widget.isSelected
                          ? AppAssets.fillIcon
                          : AppAssets.emptyIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD8C7)
      ..strokeWidth = 1;

    const dotSpacing = 4.0;
    const dotWidth = 2.0;

    double currentX = 0;
    final y = size.height / 2;

    while (currentX < size.width) {
      canvas.drawCircle(Offset(currentX, y), dotWidth / 2, paint);
      currentX += dotWidth + dotSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

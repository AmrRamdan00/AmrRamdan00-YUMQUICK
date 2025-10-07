import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../core/theme/app_colors.dart';

class FoodCardPriceSection extends StatelessWidget {
  final double itemPrice;

  const FoodCardPriceSection({super.key, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${itemPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  height: 26 / 24,
                  letterSpacing: 0,
                  color: AppColors.orangeBase,
                ),
              ),
              const QuantityCounter(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Divider line
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(height: 1, color: const Color(0xFFFFD8C7)),
        ),
      ],
    );
  }
}

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({super.key});

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int quantity = 1;
  int _direction = 1; // 1 for increment (up), -1 for decrement (down)

  void increment() {
    setState(() {
      _direction = -1;
      quantity += 1;
    });
  }

  void decrement() {
    if (quantity == 1) return;
    setState(() {
      _direction = 1;
      quantity -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _RoundIconButton(
          onTap: decrement,
          backgroundColor: AppColors.orangeBase.withOpacity(0.15),
          icon: Icons.remove,
          iconColor: Colors.white,
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 32,
          height: 28,
          child: ClipRect(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: Offset(0, _direction.toDouble()),
                  end: Offset.zero,
                ).animate(animation);
                return SlideTransition(
                  position: offsetAnimation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Text(
                '$quantity',
                key: ValueKey<int>(quantity),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  height: 26 / 24,
                  color: AppColors.font,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        _RoundIconButton(
          onTap: increment,
          backgroundColor: AppColors.orangeBase,
          icon: Icons.add,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}

class _RoundIconButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;

  const _RoundIconButton({
    required this.onTap,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
  });

  @override
  State<_RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<_RoundIconButton> {
  bool _pressed = false;

  void _handleTap() {
    HapticFeedback.selectionClick();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 90),
        scale: _pressed ? 0.92 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(widget.icon, color: widget.iconColor, size: 20),
        ),
      ),
    );
  }
}

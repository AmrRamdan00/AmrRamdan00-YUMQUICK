import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AuthFormContainer extends StatelessWidget {
  final Widget child;
  final bool isScrollable;

  const AuthFormContainer({
    super.key,
    required this.child,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
        child: isScrollable ? SingleChildScrollView(child: child) : child,
      ),
    );
  }
}

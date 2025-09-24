import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/text_style_config.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final FocusNode? focusNode;

  final TextStyleConfig? labelStyle;
  final TextStyleConfig? inputTextStyle;
  final TextStyleConfig? hintTextStyle;
  final TextStyleConfig? errorTextStyle;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final Color? fillColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderWidth;

  const AppTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.labelStyle,
    this.inputTextStyle,
    this.hintTextStyle,
    this.errorTextStyle,
    this.contentPadding,
    this.borderRadius,
    this.fillColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderWidth,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    // Get effective styles with defaults
    final effectiveLabelStyle = (widget.labelStyle ?? AppTextStyles.labelMedium)
        .toTextStyle();
    final effectiveInputTextStyle =
        (widget.inputTextStyle ?? AppTextStyles.inputText).toTextStyle();
    final effectiveHintTextStyle =
        (widget.hintTextStyle ?? AppTextStyles.inputHint).toTextStyle();

    final effectiveBorderRadius = widget.borderRadius ?? 13;
    final effectiveFillColor = widget.fillColor ?? AppColors.yellow2;
    final effectiveFocusedBorderColor =
        widget.focusedBorderColor ?? AppColors.orangeBase;
    final effectiveErrorBorderColor =
        widget.errorBorderColor ?? AppColors.error;
    final effectiveBorderWidth = widget.borderWidth ?? 2.0;
    final effectiveContentPadding =
        widget.contentPadding ??
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: effectiveLabelStyle),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText ? _isObscured : false,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          focusNode: widget.focusNode,
          style: effectiveInputTextStyle,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: effectiveHintTextStyle,
            filled: true,
            fillColor: effectiveFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              borderSide: BorderSide(
                color: effectiveFocusedBorderColor,
                width: effectiveBorderWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              borderSide: BorderSide(
                color: effectiveErrorBorderColor,
                width: effectiveBorderWidth,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              borderSide: BorderSide(
                color: effectiveErrorBorderColor,
                width: effectiveBorderWidth,
              ),
            ),
            contentPadding: effectiveContentPadding,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}

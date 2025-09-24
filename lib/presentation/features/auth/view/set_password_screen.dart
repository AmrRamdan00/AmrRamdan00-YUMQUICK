import 'package:flutter/material.dart';
import '../../../widgets/app_text_field.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_style_config.dart';
import '../../../../core/validation/password_validation.dart';
import '../widgets/auth_widgets.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password created successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  String? _validateConfirmPassword(String? value) {
    return PasswordValidation.validateConfirmPassword(
      value,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: SafeArea(
        child: Column(
          children: [
            const AuthHeader(title: 'Set Password'),

            AuthFormContainer(
              isScrollable: true,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lorem ipsum description text
                    const Text(
                      'Please create a strong password with at least 8 characters, including letters and numbers. You’ll use this password to securely access your account.',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.font,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Password field
                    AppTextField(
                      label: 'Password',
                      labelStyle: const TextStyleConfig(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                      ),
                      hintText: 'Enter your password',
                      controller: _passwordController,
                      obscureText: true,
                      validator: PasswordValidation.validatePassword,
                    ),
                    const SizedBox(height: 20),

                    // Confirm Password field
                    AppTextField(
                      label: 'Confirm Password',
                      labelStyle: const TextStyleConfig(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                      ),
                      hintText: 'Confirm your password',
                      controller: _confirmPasswordController,
                      obscureText: true,
                      validator: _validateConfirmPassword,
                    ),
                    const SizedBox(height: 40),

                    // Create New Password button
                    AuthSubmitButton(
                      text: 'Create New Password',
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      onPressed: _handleSetPassword,
                      isLoading: _isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../widgets/app_text_field.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_style_config.dart';
import '../../../../core/validation/email_validation.dart';
import '../../../../core/validation/password_validation.dart';
import '../widgets/auth_widgets.dart';
import 'set_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
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
            content: Text('Login successful!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBase,
      body: SafeArea(
        child: Column(
          children: [
            const AuthHeader(title: 'Hello!'),

            AuthFormContainer(
              isScrollable: true,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: const TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.font,
                      ),
                    ),
                    const SizedBox(height: 32),

                    AppTextField(
                      label: 'Email or Mobile Number',
                      labelStyle: const TextStyleConfig(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                      ),
                      hintText: 'example@example.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: EmailValidation.validateEmailOrMobile,
                    ),
                    const SizedBox(height: 20),

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

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SetPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forget Password ?',
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.orangeBase,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    AuthSubmitButton(
                      text: 'Log In',
                      onPressed: _handleLogin,
                      isLoading: _isLoading,
                    ),

                    SocialLoginButtons(dividerText: 'or'),

                    AuthFooter(
                      questionText: "Don't have an account? ",
                      actionText: 'Sign Up',
                      onActionPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
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

import 'package:flutter/material.dart';
import '../../../widgets/app_text_field.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_style_config.dart';
import '../../../../core/validation/email_validation.dart';
import '../../../../core/validation/password_validation.dart';
import '../../../../data/repository/restaurant_repository.dart';
import '../widgets/auth_widgets.dart';
import 'login_screen.dart';
import '../../home/view/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final RestaurantRepository _repository = RestaurantRepository();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Call the API to register user
        await _repository.registerUser(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: AppColors.success,
            ),
          );

          // Navigate to home screen after successful signup
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Signup failed: ${e.toString()}'),
              backgroundColor: AppColors.error,
            ),
          );
        }
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
            const AuthHeader(title: 'New Account'),

            AuthFormContainer(
              isScrollable: true,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      label: 'Full name',
                      labelStyle: const TextStyleConfig(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                      ),
                      hintText: 'Enter your full name',
                      controller: _nameController,
                      validator: PasswordValidation.validateName,
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
                    const SizedBox(height: 20),

                    AppTextField(
                      label: 'Email',
                      labelStyle: const TextStyleConfig(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                      ),
                      hintText: 'example@example.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: EmailValidation.validateEmail,
                    ),
                    const SizedBox(height: 20),

                    AppTextField(
                      label: 'Mobile Number',
                      labelStyle: const TextStyleConfig(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                      ),
                      hintText: '+ 123 456 789',
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),

                    AppTextField(
                      label: 'Date of birth',
                      labelStyle: const TextStyleConfig(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.font,
                      ),
                      hintText: 'DD / MM / YYYY',
                      controller: _dateOfBirthController,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          _dateOfBirthController.text =
                              '${date.day.toString().padLeft(2, '0')} / ${date.month.toString().padLeft(2, '0')} / ${date.year}';
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    const TermsAndConditions(),
                    const SizedBox(height: 5),

                    AuthSubmitButton(
                      text: 'Sign Up',
                      onPressed: _handleSignUp,
                      isLoading: _isLoading,
                    ),
                    const SizedBox(height: 9),

                    SocialLoginButtons(dividerText: 'or sign up with'),

                    AuthFooter(
                      questionText: 'Already have an account? ',
                      actionText: 'Log in',
                      onActionPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
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

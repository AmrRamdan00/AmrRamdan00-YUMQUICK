class OnboardingData {
  final String imagePath;
  final String iconPath;
  final String title;
  final String description;
  final String buttonText;

  const OnboardingData({
    required this.imagePath,
    required this.iconPath,
    required this.title,
    required this.description,
    required this.buttonText,
  });
}

class OnboardingItems {
  static const List<OnboardingData> items = [
    OnboardingData(
      imagePath: 'assets/images/onboarding_pizza.png',
      iconPath: 'assets/icons/order_icon.svg',
      title: 'Order For Food',
      description:
          'Craving something delicious? Browse your favorite meals and place your order in seconds.',
      buttonText: 'Next',
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding_dessert.png',
      iconPath: 'assets/icons/payment_icon.svg',
      title: 'Easy Payment',
      description:
          'Pay securely with just a tap—fast, safe, and hassle-free options at your fingertips.',
      buttonText: 'Next',
    ),
    OnboardingData(
      imagePath: 'assets/images/onboarding_coffee.png',
      iconPath: 'assets/icons/delivery_icon.svg',
      title: 'Fast Delivery',
      description:
          'Hot, fresh, and quick! Get your food delivered right to your door without the wait.',
      buttonText: 'Get Started',
    ),
  ];
}

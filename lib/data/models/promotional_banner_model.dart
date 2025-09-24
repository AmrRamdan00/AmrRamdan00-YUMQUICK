class PromotionalBannerModel {
  final String title;
  final String discount;
  final String imageUrl;
  final String? localImagePath; // Fallback for local images

  const PromotionalBannerModel({
    required this.title,
    required this.discount,
    required this.imageUrl,
    this.localImagePath,
  });

  factory PromotionalBannerModel.fromJson(Map<String, dynamic> json) {
    return PromotionalBannerModel(
      title: json['title'] ?? '',
      discount: json['discount'] ?? '',
      imageUrl: json['image_url'] ?? json['imageUrl'] ?? '',
      localImagePath: json['local_image_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'discount': discount,
      'image_url': imageUrl,
      'local_image_path': localImagePath,
    };
  }
}

class PromotionalBannerItems {
  // Static fallback data (can be removed when API is ready)
  static const List<PromotionalBannerModel> fallbackItems = [
    PromotionalBannerModel(
      title: 'Experience our delicious new dish',
      discount: '30% OFF',
      imageUrl:
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=500&h=300&fit=crop',
      localImagePath: 'assets/images/onboarding_pizza.png',
    ),
    PromotionalBannerModel(
      title: 'Fresh coffee every morning',
      discount: '20% OFF',
      imageUrl:
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=500&h=300&fit=crop',
      localImagePath: 'assets/images/onboarding_coffee.png',
    ),
    PromotionalBannerModel(
      title: 'Sweet treats for you',
      discount: '15% OFF',
      imageUrl:
          'https://images.unsplash.com/photo-1486427944299-d1955d23e34d?w=500&h=300&fit=crop',
      localImagePath: 'assets/images/onboarding_dessert.png',
    ),
    PromotionalBannerModel(
      title: 'Healthy vegan options',
      discount: '25% OFF',
      imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&h=300&fit=crop',
      localImagePath: 'assets/images/onboarding_pizza.png',
    ),
  ];

  // This will be populated from API
  static List<PromotionalBannerModel> items = fallbackItems;
}

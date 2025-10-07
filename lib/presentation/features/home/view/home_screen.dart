import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/repository/restaurant_repository.dart';
import '../../../../data/models/menu_item_model.dart';
import '../../menu/view/food_card_screen.dart';
import '../widgets/home_header.dart';
import '../widgets/food_categories.dart';
import '../widgets/food_section.dart';
import '../widgets/promotional_banner.dart';

class HomeScreen extends StatefulWidget {
  final Function(String)? onCategorySelected;

  const HomeScreen({super.key, this.onCategorySelected});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RestaurantRepository _repository = RestaurantRepository();
  List<MenuItemModel> _bestSellingItems = [];
  List<MenuItemModel> _recommendedItems = [];
  // List<RestaurantModel> _restaurants = []; // Will be used for restaurant listings
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      // Load data in parallel
      final results = await Future.wait([
        _repository.getBestSellingItems(),
        _repository.getRecommendedItems(),
      ]);

      setState(() {
        _bestSellingItems = results[0];
        _recommendedItems = results[1];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  String _getCategoryIdForItem(MenuItemModel item) {
    // Simple logic to determine category based on item name or type
    // You can enhance this logic based on your app's requirements
    final itemName = item.itemName.toLowerCase();

    if (itemName.contains('pizza') ||
        itemName.contains('burger') ||
        itemName.contains('sandwich')) {
      return 'meals';
    } else if (itemName.contains('cake') ||
        itemName.contains('dessert') ||
        itemName.contains('ice cream')) {
      return 'desserts';
    } else if (itemName.contains('coffee') ||
        itemName.contains('tea') ||
        itemName.contains('juice') ||
        itemName.contains('drink')) {
      return 'drinks';
    } else if (itemName.contains('salad') ||
        itemName.contains('vegan') ||
        itemName.contains('healthy')) {
      return 'vegan';
    } else if (itemName.contains('chips') ||
        itemName.contains('fries') ||
        itemName.contains('snack')) {
      return 'snacks';
    } else {
      // Default category
      return 'meals';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
          ? _buildErrorWidget()
          : _buildHomeContent(),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: AppColors.orangeBase),
          const SizedBox(height: 16),
          Text(
            'Oops! Something went wrong',
            style: AppTheme.agTitle.copyWith(color: AppColors.font),
          ),
          const SizedBox(height: 8),
          Text(
            _errorMessage,
            style: AppTheme.agParagraph,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loadData,
            style: AppTheme.primaryButtonStyle,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return Stack(
      children: [
        // Yellow header
        const HomeHeader(),
        // White content area with curved top
        Positioned(
          top: 200, // Adjust this value to control the overlap
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Add some top padding
                  FoodCategories(onCategorySelected: widget.onCategorySelected),
                  FoodSection(
                    title: 'Best Seller',
                    items: _bestSellingItems,
                    onViewAllTap: () {
                      // TODO: Navigate to all best seller items
                      print('View all best sellers');
                    },
                    onItemTap: (item) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FoodCardScreen(
                            item: item,
                            categoryId: _getCategoryIdForItem(item),
                          ),
                        ),
                      );
                    },
                    onFavoriteTap: (item) {
                      // TODO: Add to favorites
                      print('Added to favorites: ${item.itemName}');
                    },
                  ),
                  const PromotionalBanner(),
                  FoodSection(
                    title: 'Recommend',
                    items: _recommendedItems,
                    showRating: true,
                    onViewAllTap: () {
                      // TODO: Navigate to all recommended items
                      print('View all recommendations');
                    },
                    onItemTap: (item) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FoodCardScreen(
                            item: item,
                            categoryId: _getCategoryIdForItem(item),
                          ),
                        ),
                      );
                    },
                    onFavoriteTap: (item) {
                      // TODO: Add to favorites
                      print('Added to favorites: ${item.itemName}');
                    },
                  ),
                  const SizedBox(height: 100), // Space for bottom navigation
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

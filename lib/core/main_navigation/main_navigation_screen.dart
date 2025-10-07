import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../../presentation/widgets/app_navigation_bar.dart';
import '../../presentation/features/home/view/home_screen.dart';
import '../../presentation/features/menu/view/menu_screen.dart';
import '../../presentation/features/favorites/view/favorites_screen.dart';
import '../../presentation/features/orders/view/orders_screen.dart';
import '../../presentation/features/support/view/support_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check for route arguments to set initial tab
      final settings = ModalRoute.of(context)?.settings;
      if (settings?.arguments is Map<String, dynamic>) {
        final args = settings!.arguments as Map<String, dynamic>;
        final initialTab = args['initialTab'] as int?;
        if (initialTab != null && initialTab != _currentIndex) {
          setState(() {
            _currentIndex = initialTab;
          });
        }
      }
    });
  }

  List<Widget> get _screens => [
    HomeScreen(onCategorySelected: onCategorySelected),
    MenuScreen(
      key: ValueKey(_selectedCategory), // Force rebuild when category changes
      selectedCategory: _selectedCategory,
    ),
    const FavoritesScreen(),
    const OrdersScreen(),
    const SupportScreen(),
  ];

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onCategorySelected(String category) {
    print('MainNavigationScreen - Category selected: $category');
    setState(() {
      _selectedCategory = category;
      _currentIndex = 1; // Navigate to menu screen
    });
    print(
      'MainNavigationScreen - Set _selectedCategory to: $_selectedCategory, navigating to index: $_currentIndex',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        color: AppColors.white,
        child: AppNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavigationTap,
        ),
      ),
    );
  }
}

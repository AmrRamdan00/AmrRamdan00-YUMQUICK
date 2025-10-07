import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../data/models/menu_item_model.dart';
import '../../../../data/repository/restaurant_repository.dart';
import '../../../../data/services/category_filter_service.dart';
import '../../../../data/services/search_service.dart';
import '../widgets/main_menu_widgets/header_search_bar.dart';
import '../widgets/main_menu_widgets/header_iconButton.dart';
import '../widgets/main_menu_widgets/food_categories.dart';
import '../widgets/main_menu_widgets/menu_item_card.dart';
import 'food_card_screen.dart';

class MenuScreen extends StatefulWidget {
  final String? selectedCategory;

  const MenuScreen({super.key, this.selectedCategory});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _searchController = TextEditingController();
  final RestaurantRepository _repository = RestaurantRepository();
  String? _selectedCategory;
  List<MenuItemModel> _menuItems = [];
  bool _isLoading = false;
  String? _errorMessage;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Initialize with selected category if provided, default to 'snacks'
    _selectedCategory = widget.selectedCategory ?? 'snacks';
    print(
      'MenuScreen initState - received category: ${widget.selectedCategory}, using: $_selectedCategory',
    );
    _loadMenuItems();
  }

  Future<void> _loadMenuItems() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final items = await _repository.getAllItems();
      setState(() {
        _menuItems = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load menu items: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
    print('Search query: $value');
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
    print('Category selected: $category');
  }

  List<MenuItemModel> _getFilteredItems() {
    List<MenuItemModel> filteredItems = _menuItems;

    // Apply category filter first
    if (_selectedCategory != null) {
      filteredItems = CategoryFilterService.filterByCategory(
        filteredItems,
        _selectedCategory,
      );
    }

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredItems = SearchService.searchItems(filteredItems, _searchQuery);
    }

    return filteredItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Header at the top
          _buildHeader(),
          // Orange container positioned below header
          _buildOrangeContainer(),
          // White background positioned in front of orange container
          _buildWhiteBackground(),
        ],
      ),
    );
  }

  Widget _buildWhiteBackground() {
    return Positioned(
      top: 248, // Position to overlap with orange container
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
        child: Column(
          children: [
            // Sort By section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    'Sort By ',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.font,
                    ),
                  ),
                  const Text(
                    'Popular',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.orangeBase,
                    ),
                  ),
                  const Spacer(),
                  // Search results counter
                  if (_searchQuery.isNotEmpty) ...[
                    Text(
                      '${_getFilteredItems().length} results',
                      style: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  GestureDetector(
                    onTap: () {
                      // TODO: Handle sort filter tap
                      print('Sort filter tapped');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        AppAssets.searchPostfix,
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Menu content area
            Expanded(child: _buildMenuContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildOrangeContainer() {
    return Positioned(
      top: 130, // Position below the yellow header
      left: 0,
      right: 0,
      height: 140, // Height of the orange container
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.orangeBase,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: FoodCategories(
          onCategorySelected: _onCategorySelected,
          selectedCategory: _selectedCategory,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.yellowBase,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
      child: Column(
        children: [
          // Status bar spacer to push content below status bar
          SizedBox(height: MediaQuery.of(context).padding.top),
          // Main content
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row with search bar and action icons
                Row(
                  children: [
                    Expanded(
                      child: HeaderSearchBar(
                        controller: _searchController,
                        borderRadius: 30,
                        height: 35,
                        hintText: 'Search',
                        onChanged: _onSearchChanged,
                        onFilterTap: () {
                          // TODO: Handle filter tap
                          print('Filter tapped');
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    _buildActionIcons(),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcons() {
    return Row(
      children: [
        HeaderIconButton(
          icon: SvgPicture.asset(AppAssets.cartIcon, width: 34, height: 34),
          onTap: () {
            // TODO: Handle cart tap
            print('Cart tapped');
          },
        ),
        const SizedBox(width: 7),
        HeaderIconButton(
          icon: SvgPicture.asset(
            AppAssets.notificationIcon,
            width: 34,
            height: 34,
          ),
          onTap: () {
            // TODO: Handle notification tap
            print('Notification tapped');
          },
        ),
        const SizedBox(width: 7),
        HeaderIconButton(
          icon: SvgPicture.asset(AppAssets.profileIcon, width: 34, height: 34),
          onTap: () {
            // TODO: Handle profile tap
            print('Profile tapped');
          },
        ),
      ],
    );
  }

  Widget _buildMenuContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.orangeBase),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.grey),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: const TextStyle(fontSize: 16, color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadMenuItems,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangeBase,
                foregroundColor: AppColors.white,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    final filteredItems = _getFilteredItems();

    if (filteredItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _searchQuery.isNotEmpty
                  ? Icons.search_off
                  : Icons.restaurant_menu,
              size: 64,
              color: AppColors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isNotEmpty
                  ? 'No items found for "$_searchQuery"'
                  : _selectedCategory != null
                  ? 'No ${CategoryFilterService.getCategoryDisplayName(_selectedCategory!)} items available'
                  : 'No menu items available',
              style: const TextStyle(fontSize: 16, color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            if (_searchQuery.isNotEmpty) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  setState(() {
                    _searchQuery = '';
                    _searchController.clear();
                  });
                },
                child: const Text(
                  'Clear search',
                  style: TextStyle(color: AppColors.orangeBase),
                ),
              ),
            ],
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100), // Space for navigation bar
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return MenuItemCard(
          item: item,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FoodCardScreen(
                  item: item,
                  categoryId: _selectedCategory ?? 'meal',
                ),
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import 'header_iconButton.dart';
import 'header_search_bar.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    // TODO: Implement search logic here
    print('Search query: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.yellowBase,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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

                // Greeting section below
                _buildGreeting(),
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

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning',
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Rise And Shine! It\'s Breakfast Time',
          style: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.orangeBase,
          ),
        ),
      ],
    );
  }
}

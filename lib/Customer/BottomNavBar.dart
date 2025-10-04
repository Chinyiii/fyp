import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final String currentRoute;

  const BottomNavBar({super.key, required this.currentRoute});

  void _handleNavigation(BuildContext context, String route) {
    if (route == currentRoute) return;
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                Icons.directions_walk,
                Icons.directions_walk,
                'Sneaker',
                '/products',
                currentRoute == '/products',
              ),
              _buildNavItem(
                context,
                Icons.shopping_bag_outlined,
                Icons.shopping_bag,
                'Orders',
                '/orders',
                currentRoute == '/orders',
              ),
              _buildNavItem(
                context,
                Icons.home_outlined,
                Icons.home,
                'Home',
                '/home',
                currentRoute == '/home',
              ),
              _buildNavItem(
                context,
                Icons.person_outline,
                Icons.person,
                'Profile',
                '/profile',
                currentRoute == '/profile',
              ),
              _buildNavItem(
                context,
                Icons.settings_outlined,
                Icons.settings,
                'Settings',
                '/settings',
                currentRoute == '/settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context,
      IconData outlinedIcon,
      IconData filledIcon,
      String label,
      String route,
      bool isActive,
      ) {
    return GestureDetector(
      onTap: () => _handleNavigation(context, route),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF1A1A1A)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isActive ? filledIcon : outlinedIcon,
                color: isActive ? Colors.white : const Color(0xFF9E9E9E),
                size: 24,
              ),
            ),
            const SizedBox(height: 6),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                fontSize: 12,
                color: isActive
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFF9E9E9E),
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
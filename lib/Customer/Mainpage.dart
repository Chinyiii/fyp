import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2; // Home is selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Modern App Bar
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            floating: true,
            snap: true,
            title: const Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF1A1A1A),
              ),
            ),
            centerTitle: false,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Color(0xFF1A1A1A),
                      size: 24,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Color(0xFF1A1A1A),
                        size: 24,
                      ),
                    ),
                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A1A1A),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 8),

                // Enhanced Search Bar
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/products');
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFF8F8F8),
                      border: Border.all(
                        color: const Color(0xFFE5E5E5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.search,
                            color: Color(0xFF9E9E9E),
                            size: 22,
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Search for shoes, brands...',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Enhanced Hero Section
                Container(
                  height: 240,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(26),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=390&h=240&fit=crop',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withAlpha(179),
                                Colors.black.withAlpha(77),
                                Colors.transparent,
                              ],
                              stops: const [0.0, 0.4, 1.0],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 24,
                          left: 24,
                          right: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Step into Style',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 32,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Discover the latest trends',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text(
                                  'Shop Now',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Enhanced Section Headers with "View All"
                _buildSectionHeader('Featured', () {}),
                const SizedBox(height: 16),

                SizedBox(
                  height: 282,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildProductCard(
                        'Air Max 90',
                        'RM 300.00',
                        'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=200&h=240&fit=crop',
                        true, // isFavorite
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        'Air Force 1',
                        'RM 250.00',
                        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200&h=240&fit=crop',
                        false,
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        'Jordan 1',
                        'RM 510.00',
                        'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=200&h=240&fit=crop',
                        false,
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        'Dunk Low',
                        'RM 400.00',
                        'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=200&h=240&fit=crop',
                        true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                _buildSectionHeader('New Arrivals', () {}),
                const SizedBox(height: 16),

                // Enhanced New Arrivals Products
                SizedBox(
                  height: 282,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      _buildProductCard(
                        'Blazer Mid',
                        'RM 450.00',
                        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=200&h=240&fit=crop',
                        false,
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        'Air Max 97',
                        'RM 540.00',
                        'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=200&h=240&fit=crop',
                        true,
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        'React Element',
                        'RM 380.00',
                        'https://images.unsplash.com/photo-1605348532760-6753d2c43329?w=200&h=240&fit=crop',
                        false,
                      ),
                      const SizedBox(width: 16),
                      _buildProductCard(
                        'Air Zoom',
                        'RM 420.00',
                        'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?w=200&h=240&fit=crop',
                        false,
                      ),
                    ],
                  ),
                ),

                // Bottom spacing for navigation bar
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
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
                _buildNavItem(Icons.search_outlined, Icons.search, 'Search', 0),
                _buildNavItem(
                  Icons.shopping_bag_outlined,
                  Icons.shopping_bag,
                  'Orders',
                  1,
                ),
                _buildNavItem(Icons.home_outlined, Icons.home, 'Home', 2),
                _buildNavItem(Icons.person_outline, Icons.person, 'Profile', 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onViewAll) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xFF1A1A1A),
            ),
          ),
          GestureDetector(
            onTap: onViewAll,
            child: const Text(
              'View All',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF757575),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    String name,
    String price,
    String imageUrl,
    bool isFavorite,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product-detail',
          arguments: {
            'product': {'name': name, 'price': price, 'image': imageUrl},
          },
        );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(230),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : const Color(0xFF9E9E9E),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData outlinedIcon,
    IconData filledIcon,
    String label,
    int index,
  ) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });

        // Navigate to different pages based on selection
        if (index == 0) {
          Navigator.pushNamed(context, '/products');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/orders');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/profile');
        }
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF1A1A1A)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isSelected ? filledIcon : outlinedIcon,
                color: isSelected ? Colors.white : const Color(0xFF9E9E9E),
                size: 24,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: isSelected
                    ? const Color(0xFF1A1A1A)
                    : const Color(0xFF9E9E9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

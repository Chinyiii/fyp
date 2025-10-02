import 'package:fyp/Customer/BottomNavBar.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _selectedFilter = 'Featured';

  final List<String> _filterOptions = [
    'Featured',
    'Newest',
    'Price: Low to High',
    'Price: High to Low',
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Air Max 90',
      'price': 'RM 300.00',
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=200&h=173&fit=crop',
    },
    {
      'name': 'Air Force 1',
      'price': 'RM 250.00',
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200&h=173&fit=crop',
    },
    {
      'name': 'Air Jordan 1',
      'price': 'RM 400.00',
      'image':
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=200&h=173&fit=crop',
    },
    {
      'name': 'Air Max 97',
      'price': 'RM 500.00',
      'image':
          'https://images.unsplash.com/photo-1556906781-9a412961c28c?w=200&h=173&fit=crop',
    },
    {
      'name': 'Air Max 270',
      'price': 'RM 440.00',
      'image':
          'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=200&h=173&fit=crop',
    },
    {
      'name': 'Air Max 95',
      'price': 'RM 350.00',
      'image':
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=200&h=173&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Sneakers',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF141414),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Color(0xFF141414),
                size: 24,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFEDEDED),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Color(0xFF737373),
                    size: 24,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Search  for sneakers',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF737373),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Filter Buttons
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filterOptions.length,
              itemBuilder: (context, index) {
                final filter = _filterOptions[index];
                final isSelected = _selectedFilter == filter;

                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF141414)
                            : const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          filter,
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF141414),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Product Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return _buildProductCard(product);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: '/products'),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product-detail',
          arguments: {'product': product},
        );
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(product['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Product Info
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF141414),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product['price'],
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF737373),
                      ),
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

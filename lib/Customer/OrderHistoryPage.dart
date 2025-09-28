import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int _selectedIndex = 0; // 0 for Active, 1 for History
  int _bottomNavIndex = 1; // Orders tab is selected

  // Sample order data - in real app this would come from order service
  final List<Map<String, dynamic>> activeOrders = [
    {
      'orderNumber': '1234567890',
      'date': '01/06/25',
      'total': 1050.00,
      'status': 'Active',
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=70&h=93&fit=crop',
    },
  ];

  final List<Map<String, dynamic>> historyOrders = [
    {
      'orderNumber': '876543',
      'date': '01/06/25',
      'total': 100.00,
      'status': 'Delivered',
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=70&h=93&fit=crop',
    },
    {
      'orderNumber': '234567',
      'date': '01/06/25',
      'total': 100.00,
      'status': 'Delivered',
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=70&h=93&fit=crop',
    },
    {
      'orderNumber': '987654',
      'date': '01/06/25',
      'total': 100.00,
      'status': 'Delivered',
      'image':
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=70&h=93&fit=crop',
    },
    {
      'orderNumber': '123456',
      'date': '01/06/25',
      'total': 100.00,
      'status': 'Delivered',
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=70&h=93&fit=crop',
    },
  ];

  List<Map<String, dynamic>> get currentOrders {
    return _selectedIndex == 0 ? activeOrders : historyOrders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF141414),
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Orders',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF141414),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab Navigation
          _buildTabNavigation(),

          // Orders List
          Expanded(
            child: currentOrders.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: currentOrders.length,
                    itemBuilder: (context, index) {
                      return _buildOrderCard(currentOrders[index]);
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFDBDBDB), width: 1)),
      ),
      child: Row(
        children: [
          // Active Tab
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedIndex == 0
                          ? Colors.black
                          : const Color(0xFFE5E8EB),
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: _selectedIndex == 0
                        ? Colors.black
                        : const Color(0xFF737373),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // History Tab
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedIndex == 1
                          ? Colors.black
                          : const Color(0xFFE5E8EB),
                      width: 3,
                    ),
                  ),
                ),
                child: Text(
                  'History',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: _selectedIndex == 1
                        ? Colors.black
                        : const Color(0xFF737373),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/order-details',
          arguments: {'order': order},
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 70,
              height: 93,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(order['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Order Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Order Number
                  Text(
                    'Order number: ${order['orderNumber']}',
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF141414),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Order Date
                  Text(
                    'Order date: ${order['date']}',
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF737373),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Total
                  Text(
                    'Total: RM ${order['total'].toStringAsFixed(2)}',
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

            // Arrow Icon
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_bag_outlined,
            size: 80,
            color: Color(0xFF737373),
          ),
          const SizedBox(height: 16),
          Text(
            _selectedIndex == 0 ? 'No Active Orders' : 'No Order History',
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xFF141414),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your orders will appear here',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF737373),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(top: BorderSide(color: Color(0xFFEDEDED), width: 1)),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Search
              _buildNavItem(
                icon: Icons.search,
                label: 'Search',
                index: 0,
                isSelected: _bottomNavIndex == 0,
              ),

              // Orders
              _buildNavItem(
                icon: Icons.shopping_bag,
                label: 'Orders',
                index: 1,
                isSelected: _bottomNavIndex == 1,
              ),

              // Home
              _buildNavItem(
                icon: Icons.home,
                label: 'Home',
                index: 2,
                isSelected: _bottomNavIndex == 2,
              ),

              // Profile
              _buildNavItem(
                icon: Icons.person,
                label: 'Profile',
                index: 3,
                isSelected: _bottomNavIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _bottomNavIndex = index;
        });

        // Handle navigation
        switch (index) {
          case 0: // Search
            Navigator.pushNamed(context, '/products');
            break;
          case 1: // Orders (current page)
            // Already on orders page
            break;
          case 2: // Home
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
            break;
          case 3: // Profile
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.black : const Color(0xFF737373),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: isSelected ? Colors.black : const Color(0xFF737373),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

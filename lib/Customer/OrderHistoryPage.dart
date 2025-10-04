import 'package:fyp/Customer/BottomNavBar.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int _selectedIndex = 0; // 0 for Active, 1 for History

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
      'status': 'Completed',
      'image':
      'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=70&h=93&fit=crop',
    },
    {
      'orderNumber': '234567',
      'date': '01/06/25',
      'total': 100.00,
      'status': 'Completed',
      'image':
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=70&h=93&fit=crop',
    },
    {
      'orderNumber': '987654',
      'date': '01/06/25',
      'total': 100.00,
      'status': 'Completed',
      'image':
      'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=70&h=93&fit=crop',
    },
    {
      'orderNumber': '123456',
      'date': '01/06/25',
      'total': 100.00,
      'status': 'Completed',
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
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Color(0xFF0A0A0A),
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildTabNavigation(),
          const SizedBox(height: 16),
          Expanded(
            child: currentOrders.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: currentOrders.length,
              itemBuilder: (context, index) {
                return _buildOrderCard(currentOrders[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: '/orders'),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = 0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: _selectedIndex == 0
                      ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                      : null,
                ),
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: _selectedIndex == 0
                        ? const Color(0xFF0A0A0A)
                        : const Color(0xFF9E9E9E),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = 1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: _selectedIndex == 1
                      ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                      : null,
                ),
                child: Text(
                  'History',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: _selectedIndex == 1
                        ? const Color(0xFF0A0A0A)
                        : const Color(0xFF9E9E9E),
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
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF8F8F8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    order['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order #${order['orderNumber'].toString().substring(0, 6)}',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF0A0A0A),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: order['status'] == 'Active'
                                ? const Color(0xFF0A0A0A)
                                : const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            order['status'],
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: order['status'] == 'Active'
                                  ? Colors.white
                                  : const Color(0xFF757575),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: Color(0xFF9E9E9E),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          order['date'],
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RM ${order['total'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Color(0xFF0A0A0A),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Color(0xFF0A0A0A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: Color(0xFF9E9E9E),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _selectedIndex == 0 ? 'No Active Orders' : 'No Order History',
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your orders will appear here',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}
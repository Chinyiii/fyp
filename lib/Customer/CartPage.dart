import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Air Max 90',
      'size': '9',
      'price': 300.00,
      'quantity': 1,
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=70&h=70&fit=crop',
    },
    {
      'name': 'Air Force 1',
      'size': '10',
      'price': 300.00,
      'quantity': 1,
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=70&h=70&fit=crop',
    },
    {
      'name': 'Air Jordan 1',
      'size': '8',
      'price': 450.00,
      'quantity': 1,
      'image':
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=70&h=70&fit=crop',
    },
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  double get totalPrice {
    return cartItems.fold(0.0, (sum, item) {
      return sum + (item['price'] * item['quantity']);
    });
  }

  double get subtotal => totalPrice;
  double get shipping => cartItems.isEmpty ? 0.0 : 15.00;
  double get tax => subtotal * 0.08; // 8% tax
  double get finalTotal => subtotal + shipping + tax;

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      setState(() {
        cartItems[index]['quantity'] = newQuantity;
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item removed from cart'),
        backgroundColor: const Color(0xFF1A1A1A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void clearAll() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Clear Cart',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color(0xFF1A1A1A),
            ),
          ),
          content: const Text(
            'Are you sure you want to remove all items from your cart?',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF757575),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF757575),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  cartItems.clear();
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'Clear All',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Enhanced App Bar
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: true,
            leading: Container(
              margin: const EdgeInsets.only(left: 16),
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF1A1A1A),
                    size: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: const Text(
              'Shopping Cart',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF1A1A1A),
              ),
            ),
            centerTitle: false,
            actions: [
              if (cartItems.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: clearAll,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Clear All',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: cartItems.isEmpty
                ? _buildEmptyCart()
                : FadeTransition(
                    opacity: _fadeController,
                    child: SlideTransition(
                      position:
                          Tween<Offset>(
                            begin: const Offset(0, 0.1),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: _slideController,
                              curve: Curves.easeOutCubic,
                            ),
                          ),
                      child: _buildCartContent(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 64,
                color: Color(0xFF9E9E9E),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your cart is empty',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add some items to get started',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF9E9E9E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartContent() {
    return Column(
      children: [
        const SizedBox(height: 8),

        // Items Count Header
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                '${cartItems.length} item${cartItems.length > 1 ? 's' : ''} in cart',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Cart Items
        ...cartItems.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;
          return _buildCartItem(item, index);
        }).toList(),

        const SizedBox(height: 32),

        // Order Summary
        _buildOrderSummary(),

        const SizedBox(height: 24),

        // Checkout Section
        _buildCheckoutSection(),

        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image with enhanced styling
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(item['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Size ${item['size']}',
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'RM ${item['price'].toStringAsFixed(2)}',
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

          // Controls
          Column(
            children: [
              // Quantity Controls
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () => updateQuantity(index, item['quantity'] - 1),
                    ),
                    Container(
                      width: 40,
                      height: 32,
                      alignment: Alignment.center,
                      child: Text(
                        '${item['quantity']}',
                        style: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () => updateQuantity(index, item['quantity'] + 1),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Remove Button
              GestureDetector(
                onTap: () => removeItem(index),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow('Subtotal', subtotal),
          const SizedBox(height: 8),
          _buildSummaryRow('Shipping', shipping),
          const SizedBox(height: 8),
          _buildSummaryRow('Tax', tax),
          const SizedBox(height: 16),
          Container(height: 1, color: const Color(0xFFE5E5E5)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Text(
                'RM ${finalTotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF757575),
          ),
        ),
        Text(
          'RM ${amount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Promo Code Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5E5E5)),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter promo code',
                      hintStyle: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF9E9E9E),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Checkout Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

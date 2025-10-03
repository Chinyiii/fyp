import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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

  double get subtotal => cartItems.fold(0.0, (sum, item) => sum + (item['price'] * item['quantity']));
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
      const SnackBar(
        content: Text('Item removed from cart'),
        backgroundColor: Color(0xFF0A0A0A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        margin: EdgeInsets.all(16),
        duration: Duration(seconds: 2),
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
              color: Color(0xFF0A0A0A),
            ),
          ),
          content: const Text(
            'Are you sure you want to remove all items from your cart?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF757575),
              height: 1.5,
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF0A0A0A),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cartItems.clear();
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Clear All',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Color(0xFF0A0A0A),
            letterSpacing: -0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF0A0A0A),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (cartItems.isNotEmpty)
            IconButton(
              onPressed: clearAll,
              icon: const Icon(Icons.delete_outline, color: Colors.red),
            ),
        ],
      ),
      body: cartItems.isEmpty
          ? _buildEmptyCart()
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 16),
                  ...cartItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> item = entry.value;
                    return _buildCartItem(item, index);
                  }).toList(),
                  const SizedBox(height: 32),
                  _buildOrderSummary(),
                ],
              ),
            ),
      bottomNavigationBar: cartItems.isEmpty ? null : _buildCheckoutButton(),
    );
  }

  Widget _buildEmptyCart() {
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
              color: Color(0xFF0A0A0A),
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
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(item['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xFF0A0A0A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Size: ${item['size']}',
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'RM ${item['price'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Color(0xFF0A0A0A),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => removeItem(index),
                icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildQuantityButton(
                    icon: Icons.remove,
                    onTap: () => updateQuantity(index, item['quantity'] - 1),
                  ),
                  SizedBox(
                    width: 40,
                    child: Text(
                      '${item['quantity']}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF0A0A0A),
                      ),
                    ),
                  ),
                  _buildQuantityButton(
                    icon: Icons.add,
                    onTap: () => updateQuantity(index, item['quantity'] + 1),
                  ),
                ],
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
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF0A0A0A)),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
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
              color: Color(0xFF141414),
            ),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow('Subtotal', subtotal),
          const SizedBox(height: 12),
          _buildSummaryRow('Shipping', shipping),
          const SizedBox(height: 12),
          _buildSummaryRow('Tax', tax),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE0E0E0)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Color(0xFF0A0A0A),
                ),
              ),
              Text(
                'RM ${finalTotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Color(0xFF0A0A0A),
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
            fontWeight: FontWeight.w500,
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
            color: Color(0xFF0A0A0A),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A0A0A),
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
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
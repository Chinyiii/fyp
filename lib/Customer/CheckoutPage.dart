import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Sample data - in real app this would come from cart service
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Air Max 90',
      'size': '9',
      'price': 300.00,
      'quantity': 1,
      'image':
          'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=56&h=56&fit=crop',
    },
    {
      'name': 'Air Jordan 1',
      'size': '8',
      'price': 450.00,
      'quantity': 1,
      'image':
          'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=56&h=56&fit=crop',
    },
    {
      'name': 'Air Force 1',
      'size': '10',
      'price': 300.00,
      'quantity': 1,
      'image':
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=56&h=56&fit=crop',
    },
  ];

  final Map<String, dynamic> shippingAddress = {
    'street': '123, Jalan Test',
    'city': 'Penang,11060',
  };

  double get subtotal {
    return cartItems.fold(0.0, (sum, item) {
      return sum + (item['price'] * item['quantity']);
    });
  }

  double get shipping => 0.0; // Free shipping
  double get total => subtotal + shipping;

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
          'Checkout',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF141414),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Order Summary Section
            _buildSectionHeader('Order Summary'),
            _buildOrderItems(),
            _buildPriceBreakdown(),

            // Shipping Address Section
            _buildSectionHeader('Shipping Address'),
            _buildShippingAddress(),

            // Payment Method Section
            _buildSectionHeader('Payment Method'),
            _buildPaymentMethod(),

            // Bottom spacing for payment button
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFAFAFA),
          border: Border(top: BorderSide(color: Color(0xFFEDEDED), width: 1)),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/payment', arguments: {
                    'cartItems': cartItems,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Make Payment',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Color(0xFF141414),
        ),
      ),
    );
  }

  Widget _buildOrderItems() {
    return Column(
      children: cartItems.map((item) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              // Product Image
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
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
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF141414),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Size ${item['size']}',
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
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceBreakdown() {
    return Column(
      children: [
        // Subtotal
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
              Text(
                'RM${subtotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Shipping
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shipping',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
              Text(
                shipping == 0 ? 'Free' : 'RM${shipping.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Total
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
              Text(
                'RM${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildShippingAddress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Address Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shippingAddress['street'],
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF141414),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  shippingAddress['city'],
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

          // Edit Icon
          const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Payment Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.credit_card,
              color: Color(0xFF141414),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),

          // Payment Method Info
          const Expanded(
            child: Text(
              'Debit Card',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF141414),
              ),
            ),
          ),

          // Arrow Icon
          const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black),
        ],
      ),
    );
  }
}

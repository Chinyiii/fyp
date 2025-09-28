import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const OrderConfirmationPage({super.key, required this.cartItems});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  // Sample order data - in real app this would come from order service
  final String orderNumber = '1234567890';
  final String estimatedDelivery = 'June 15, 2025';

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
          'Order Confirmation',
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
            // Success Message
            _buildSuccessMessage(),

            // Order Details
            _buildOrderDetails(),

            // Items Section
            _buildItemsSection(),

            // Bottom spacing for OK button
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
                  // Navigate back to main page
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'OK',
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

  Widget _buildSuccessMessage() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Column(
        children: [
          // Success Icon
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: const Icon(
              Icons.check_circle,
              size: 64,
              color: Colors.green,
            ),
          ),

          // Success Message
          const Text(
            'Your order has been placed successfully. You will receive an email confirmation shortly.',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF141414),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails() {
    return Column(
      children: [
        // Order Number
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Order Number',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
              Text(
                orderNumber,
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

        // Estimated Delivery
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Estimated Delivery',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
              Text(
                estimatedDelivery,
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
      ],
    );
  }

  Widget _buildItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Items Header
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: const Text(
            'Items',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Color(0xFF141414),
            ),
          ),
        ),

        // Items List
        ...widget.cartItems.map((item) => _buildOrderItem(item)).toList(),
      ],
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> item) {
    return Container(
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
            height: 70,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Product Name
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

                // Quantity
                Text(
                  'Quantity: ${item['quantity']}',
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF737373),
                  ),
                ),
                const SizedBox(height: 2),

                // Size
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
  }
}

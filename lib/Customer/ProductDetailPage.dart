import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _selectedSize = '9';

  final List<String> _sizes = ['7', '8', '9', '10', '11', '12'];

  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Yee Ter',
      'avatar':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=40&h=40&fit=crop&crop=face',
      'rating': 5,
      'date': '1 month ago',
      'comment':
          'These sneakers are amazing! The comfort is top-notch, and they look even better in person. Highly recommend!',
    },
    {
      'name': 'Kuanyik',
      'avatar':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=40&h=40&fit=crop&crop=face',
      'rating': 4,
      'date': '2 months ago',
      'comment':
          'Great shoes overall. Stylish and comfortable, but the sizing runs a bit small. Consider ordering a half size up.',
    },
  ];

  final Map<String, int> _ratingDistribution = {
    '5': 40,
    '4': 30,
    '3': 15,
    '2': 10,
    '1': 5,
  };

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
          'Sneaker Details',
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
            // Product Image
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Product Name
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Text(
                widget.product['name'],
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xFF141414),
                ),
              ),
            ),

            // Product Price
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Text(
                widget.product['price'],
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFF141414),
                ),
              ),
            ),

            // Product Description
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: const Text(
                'The Air Max 90 stays true to its roots with the iconic Waffle sole, stitched overlays and classic TPU accents. Fresh colors give a modern look while Max Air cushioning adds comfort to your journey.',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF141414),
                  height: 1.5,
                ),
              ),
            ),

            // Size Selection
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: const Text(
                'Size',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF141414),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              child: Wrap(
                spacing: 12,
                children: _sizes.map((size) {
                  final isSelected = _selectedSize == size;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = size;
                      });
                    },
                    child: Container(
                      width: 48,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF141414)
                            : const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          size,
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
                  );
                }).toList(),
              ),
            ),

            // Ratings & Reviews Header
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: const Text(
                'Ratings & Reviews',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF141414),
                ),
              ),
            ),

            // Ratings Overview
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Overall Rating
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '4.5',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w800,
                          fontSize: 36,
                          color: Color(0xFF141414),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(5, (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 2),
                            child: const Icon(
                              Icons.star,
                              color: Colors.black,
                              size: 18,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '123 reviews',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF141414),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 32),

                  // Rating Distribution
                  Expanded(
                    child: Column(
                      children: _ratingDistribution.entries.map((entry) {
                        final rating = entry.key;
                        final percentage = entry.value;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16,
                                child: Text(
                                  rating,
                                  style: const TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xFF141414),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDBDBDB),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor: percentage / 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              SizedBox(
                                width: 30,
                                child: Text(
                                  '$percentage%',
                                  style: const TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xFF737373),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            // Customer Reviews
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: _reviews.map((review) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Profile Picture
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(review['avatar']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Name and Date
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    review['name'],
                                    style: const TextStyle(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color(0xFF141414),
                                    ),
                                  ),
                                  Text(
                                    review['date'],
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
                        const SizedBox(height: 12),
                        // Star Rating
                        Row(
                          children: List.generate(5, (index) {
                            final isFilled = index < review['rating'];
                            return Container(
                              margin: const EdgeInsets.only(right: 2),
                              child: Icon(
                                Icons.star,
                                color: isFilled
                                    ? Colors.black
                                    : const Color(0xFFC2C2C2),
                                size: 20,
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 12),
                        // Review Text
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            review['comment'],
                            style: const TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFF141414),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            // Bottom spacing for action buttons
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
            child: Row(
              children: [
                // AR Try On Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Implement AR Try On functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('AR Try On feature coming soon!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text(
                          'AR Try On',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF141414),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Add to Cart Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to cart page
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Center(
                        child: Text(
                          'Add to Cart',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

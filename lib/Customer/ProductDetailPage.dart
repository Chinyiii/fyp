import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _selectedSize = '9';
  bool _is360View = false;

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
        centerTitle: true,
        title: const Text(
          'Sneaker Details',
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 260,
              width: double.infinity,
              child: Stack(
                children: [
                  if (!_is360View)
                    Image.network(
                      widget.product['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  if (_is360View)
                    Panorama(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1552346154-21d32810aba3?w=1024&h=512&fit=crop',
                      ),
                    ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _is360View = !_is360View;
                        });
                      },
                      icon: Icon(
                        _is360View ? Icons.image_outlined : Icons.threesixty_outlined,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product['name'],
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product['price'],
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The Air Max 90 stays true to its roots with the iconic Waffle sole, stitched overlays and classic TPU accents. Fresh colors give a modern look while Max Air cushioning adds comfort to your journey.',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF757575),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSizeSelection(),
            const SizedBox(height: 32),
            _buildRatingsAndReviews(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Size',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFF141414),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: _sizes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final size = _sizes[index];
              final isSelected = _selectedSize == size;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedSize = size;
                  });
                },
                child: Container(
                  width: 48,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF0A0A0A) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? const Color(0xFF0A0A0A) : const Color(0xFFE0E0E0),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      size,
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: isSelected ? Colors.white : const Color(0xFF0A0A0A),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRatingsAndReviews() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ratings & Reviews',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFF141414),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '4.5',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 48,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(Icons.star, color: Colors.black, size: 20);
                    }),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '123 reviews',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Column(
                  children: _ratingDistribution.entries.map((entry) {
                    final rating = entry.key;
                    final percentage = entry.value;
                    return Row(
                      children: [
                        Text(
                          rating,
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFF757575),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: percentage / 100,
                            backgroundColor: const Color(0xFFE0E0E0),
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0A0A0A)),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ..._reviews.map((review) => _buildReviewItem(review)).toList(),
        ],
      ),
    );
  }

  Widget _buildReviewItem(Map<String, dynamic> review) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(review['avatar']),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['name'],
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    review['date'],
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: List.generate(5, (index) {
                  final isFilled = index < review['rating'];
                  return Icon(
                    isFilled ? Icons.star : Icons.star_border,
                    color: isFilled ? Colors.black : const Color(0xFFC2C2C2),
                    size: 16,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review['comment'],
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF757575),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
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
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('AR Try On feature coming soon!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'AR Try On',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF0A0A0A),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A0A0A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Add to Cart',
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
            ],
          ),
        ),
      ),
    );
  }
}
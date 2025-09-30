import 'package:flutter/material.dart';

class RatingAndReviewPage extends StatefulWidget {
  final Map<String, dynamic>? product;

  const RatingAndReviewPage({
    super.key,
    this.product,
    required Map<String, dynamic> order,
  });

  @override
  State<RatingAndReviewPage> createState() => _RatingAndReviewPageState();
}

class _RatingAndReviewPageState extends State<RatingAndReviewPage> {
  int _selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final isSelected = index < _selectedRating;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedRating = index + 1;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            child: Icon(
              Icons.star,
              color: isSelected
                  ? const Color(0xFF000000)
                  : const Color(0xFFC2C2C2),
              size: 30,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPhotoUploadSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFDBDBDB),
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(56),
        child: Column(
          children: [
            // Upload Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(Icons.add, color: Color(0xFF141414), size: 24),
            ),
            const SizedBox(height: 24),
            // Upload Text
            Column(
              children: [
                const Text(
                  'Add photos',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xFF141414),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add Photos',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF141414),
                  ),
                ),
                const SizedBox(height: 24),
                // Upload Button
                GestureDetector(
                  onTap: () {
                    // TODO: Implement photo picker functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Photo picker coming soon!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Container(
                    width: 84,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xFF141414),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          if (_selectedRating == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please select a rating'),
                duration: Duration(seconds: 2),
              ),
            );
            return;
          }

          // TODO: Implement submit review functionality
          // Navigate to review confirmation page
          Navigator.pushNamed(context, '/review-confirmation');
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF000000),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(
            child: Text(
              'Submit Review',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
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
          'Write a review',
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Rating Question
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: const Text(
                      'How would you rate this product?',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF141414),
                      ),
                    ),
                  ),

                  // Star Rating
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: _buildStarRating(),
                  ),

                  // Review Text Label
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: const Text(
                      'Write your review',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF141414),
                      ),
                    ),
                  ),

                  // Review Text Input
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      border: Border.all(
                        color: const Color(0xFFDBDBDB),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _reviewController,
                      maxLines: 6,
                      decoration: const InputDecoration(
                        hintText: 'Share your thoughts about this product...',
                        hintStyle: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF737373),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF141414),
                      ),
                    ),
                  ),

                  // Add Photos Label
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: const Text(
                      'Add photos',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF141414),
                      ),
                    ),
                  ),

                  // Photo Upload Section
                  _buildPhotoUploadSection(),

                  // Bottom spacing
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Submit Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFAFAFA),
              border: Border(
                top: BorderSide(color: Color(0xFFEDEDED), width: 1),
              ),
            ),
            child: SafeArea(child: _buildSubmitButton()),
          ),
        ],
      ),
    );
  }
}

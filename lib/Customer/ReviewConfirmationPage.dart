import 'package:flutter/material.dart';

class ReviewConfirmationPage extends StatelessWidget {
  const ReviewConfirmationPage({super.key});

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
          'Review',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Thank you message
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                  child: const Text(
                    'Thank you for your review!',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xFF141414),
                      height: 1.27,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Description text
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: const Text(
                    'Your feedback helps us improve our products and services. We appreciate your time and effort in sharing your thoughts.',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF141414),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          // Done Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFAFAFA),
              border: Border(
                top: BorderSide(color: Color(0xFFEDEDED), width: 1),
              ),
            ),
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  // Navigate back to the main page or product detail page
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF000000),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      'Done',
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
        ],
      ),
    );
  }
}


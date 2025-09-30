import 'package:flutter/material.dart';

class AppFirstPage extends StatelessWidget {
  const AppFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            // Top spacing
            const SizedBox(height: 116),

            // Sneaker Image
            Container(
              width: 308,
              height: 306,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF5F5F5),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=308&h=306&fit=crop',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Welcome Text
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: const Text(
                'Welcome to\nSneakerVault,\nPlease log in or register to continue using our app',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF141414),
                  height: 1.25,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            const Spacer(),

            // Login Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  // Navigate to login page
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                  width: 358,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF000000),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
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

            const SizedBox(height: 12),

            // Register Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  // Navigate to register page
                  Navigator.pushNamed(context, '/register');
                },
                child: Container(
                  width: 358,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

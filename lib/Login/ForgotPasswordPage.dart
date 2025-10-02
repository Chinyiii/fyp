import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleResetPassword() {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email address'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // TODO: Implement actual password reset logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset email sent! Check your inbox.'),
        duration: Duration(seconds: 3),
      ),
    );

    // Navigate back to login page after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  void _handleBackToLogin() {
    Navigator.pushNamed(context, '/login');
  }

  void _handleRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header with back button and title
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFF141414),
                                size: 24,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: const Text(
                                'Reset Password',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xFF141414),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 48), // Balance the back button
                        ],
                      ),
                    ),

                    // Welcome message
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                      child: const Text(
                        'Forgot your password? No Worries, we\'re here to help!',
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

                    // Email field
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF141414),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDEDED),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF737373),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF141414),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Reset password button
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                      child: GestureDetector(
                        onTap: _handleResetPassword,
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFF000000),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Center(
                            child: Text(
                              'Reset password',
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

                    // Back to login link
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: _handleBackToLogin,
                          child: const Text(
                            'Back to login',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF737373),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Register link
            Container(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: GestureDetector(
                onTap: _handleRegister,
                child: const Text(
                  "Don't have an account? Register now",
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF737373),
                  ),
                ),
              ),
            ),

            // Bottom spacing
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


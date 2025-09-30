import 'package:flutter/material.dart';
import 'package:fyp/Customer/Mainpage.dart';
import 'package:fyp/Customer/ProductPage.dart';
import 'package:fyp/Customer/ProductDetailPage.dart';
import 'package:fyp/Customer/CartPage.dart';
import 'package:fyp/Customer/CheckoutPage.dart';
import 'package:fyp/Customer/PaymentPage.dart';
import 'package:fyp/Customer/OrderConfirmationPage.dart';
import 'package:fyp/Customer/OrderHistoryPage.dart';
import 'package:fyp/Customer/OrderDetailsPage.dart';
import 'package:fyp/Customer/RatingAndReviewPage.dart';
import 'package:fyp/Customer/ReviewConfirmationPage.dart';
import 'package:fyp/AppFirstPage.dart';
import 'package:fyp/Customer/SearchPage.dart';
import 'package:fyp/Customer/WishlistPage.dart';
import 'package:fyp/Login/LoginPage.dart';
import 'package:fyp/Login/RegisterPage.dart';
import 'package:fyp/Login/ForgotPasswordPage.dart';
import 'package:fyp/Customer/ProfilePage.dart';
import 'package:fyp/Customer/EditInformationPage.dart';
import 'package:fyp/services/WishlistService.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WishlistService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneaker Store App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF121417)),
        useMaterial3: true,
        fontFamily: 'Plus Jakarta Sans',
      ),
      home: const AppFirstPage(),
      routes: {
        '/home': (context) => const MainPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/wishlist': (context) => const WishlistPage(),
        '/search': (context) => const SearchPage(),
        '/products': (context) => const ProductPage(),
        '/product-detail': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return ProductDetailPage(product: args['product']);
        },
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => const CheckoutPage(),
        '/payment': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return PaymentPage(cartItems: args['cartItems']);
        },
        '/order-confirmation': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return OrderConfirmationPage(cartItems: args['cartItems']);
        },
        '/orders': (context) => const OrderHistoryPage(),
        '/order-details': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return OrderDetailsPage(order: args['order']);
        },
        '/rating-review': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return RatingAndReviewPage(order: args['order']);
        },
        '/review-confirmation': (context) => const ReviewConfirmationPage(),
        '/profile': (context) => const ProfilePage(),
        '/edit-information': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          return EditInformationPage(
            fieldType: args['fieldType'],
            currentValue: args['currentValue'],
          );
        },
      },
    );
  }
}

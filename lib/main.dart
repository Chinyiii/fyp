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

void main() {
  runApp(const MyApp());
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
      home: const MainPage(),
      routes: {
        '/home': (context) => const MainPage(),
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
        '/profile': (context) => Scaffold(
          appBar: AppBar(title: const Text('Profile')),
          body: const Center(child: Text('Profile Page - Coming Soon')),
        ),
      },
    );
  }
}

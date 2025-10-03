import 'package:flutter/material.dart';
import 'package:fyp/AppFirstPage.dart';
import 'package:fyp/Customer/AboutPage.dart';
import 'package:fyp/Customer/AddEditAddressPage.dart';
import 'package:fyp/Customer/AddressBookPage.dart';
import 'package:fyp/Customer/BrandsPage.dart';
import 'package:fyp/Customer/CartPage.dart';
import 'package:fyp/Customer/CategoriesPage.dart';
import 'package:fyp/Customer/CheckoutPage.dart';
import 'package:fyp/Customer/EditInformationPage.dart';
import 'package:fyp/Customer/HelpSupportPage.dart';
import 'package:fyp/Customer/Mainpage.dart';
import 'package:fyp/Customer/NotificationCenterPage.dart';
import 'package:fyp/Customer/OrderConfirmationPage.dart';
import 'package:fyp/Customer/OrderDetailsPage.dart';
import 'package:fyp/Customer/OrderHistoryPage.dart';
import 'package:fyp/Customer/PaymentPage.dart';
import 'package:fyp/Customer/ProductDetailPage.dart';
import 'package:fyp/Customer/ProductPage.dart';
import 'package:fyp/Customer/ProfilePage.dart';
import 'package:fyp/Customer/RatingAndReviewPage.dart';
import 'package:fyp/Customer/ReviewConfirmationPage.dart';
import 'package:fyp/Customer/SearchPage.dart';
import 'package:fyp/Customer/SettingsPage.dart';
import 'package:fyp/Customer/WishlistPage.dart';
import 'package:fyp/Login/LoginPage.dart';
import 'package:fyp/Login/RegisterPage.dart';

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
      home: const AppFirstPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/edit-information':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) {
                return EditInformationPage(
                  fieldType: args['fieldType'],
                  currentValue: args['currentValue'],
                );
              },
            );
          case '/rating-review':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) {
                return RatingAndReviewPage(
                  order: args['order'],
                );
              },
            );
          case '/add-edit-address':
            final args = settings.arguments as Map<String, dynamic>?;
            return MaterialPageRoute(
              builder: (context) {
                return AddEditAddressPage(
                  address: args?['address'],
                );
              },
            );
          default:
            return null;
        }
      },
      routes: {
        '/home': (context) => const MainPage(),
        '/products': (context) => const ProductPage(),
        '/product-detail': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return ProductDetailPage(product: args['product']);
        },
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => const CheckoutPage(),
        '/payment': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return PaymentPage(cartItems: args['cartItems']);
        },
        '/order-confirmation': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return OrderConfirmationPage(cartItems: args['cartItems']);
        },
        '/orders': (context) => const OrderHistoryPage(),
        '/order-details': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return OrderDetailsPage(order: args['order']);
        },
        '/profile': (context) => const ProfilePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/brands': (context) => BrandsPage(),
        '/categories': (context) => CategoriesPage(),
        '/wishlist': (context) => const WishlistPage(),
        '/about': (context) => AboutPage(),
        '/help': (context) => HelpSupportPage(),
        '/notifications': (context) => NotificationCenterPage(),
        '/review-confirmation': (context) => const ReviewConfirmationPage(),
        '/search': (context) => const SearchPage(),
        '/settings': (context) => SettingsPage(),
        '/address-book': (context) => const AddressBookPage(),
      },
    );
  }
}

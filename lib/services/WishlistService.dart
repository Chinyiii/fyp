import 'package:flutter/material.dart';

class WishlistService extends ChangeNotifier {
  final List<Map<String, dynamic>> _wishlist = [];

  List<Map<String, dynamic>> get wishlist => _wishlist;

  void addToWishlist(Map<String, dynamic> product) {
    _wishlist.add(product);
    notifyListeners();
  }

  void removeFromWishlist(Map<String, dynamic> product) {
    _wishlist.removeWhere((item) => item['name'] == product['name']);
    notifyListeners();
  }

  bool isInWishlist(Map<String, dynamic> product) {
    return _wishlist.any((item) => item['name'] == product['name']);
  }
}

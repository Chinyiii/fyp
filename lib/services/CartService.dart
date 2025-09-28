import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String size;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.size,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'size': size,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      name: map['name'],
      size: map['size'],
      price: map['price'],
      image: map['image'],
      quantity: map['quantity'],
    );
  }
}

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(CartItem item) {
    // Check if item with same name and size already exists
    final existingIndex = _items.indexWhere(
      (existingItem) =>
          existingItem.name == item.name && existingItem.size == item.size,
    );

    if (existingIndex >= 0) {
      // Update quantity of existing item
      _items[existingIndex].quantity += item.quantity;
    } else {
      // Add new item
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _items.length && newQuantity > 0) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void clearAll() {
    _items.clear();
    notifyListeners();
  }

  void addFromProduct(Map<String, dynamic> product, String selectedSize) {
    final cartItem = CartItem(
      name: product['name'],
      size: selectedSize,
      price: double.parse(
        product['price'].replaceAll('RM ', '').replaceAll(',', ''),
      ),
      image: product['image'],
    );
    addItem(cartItem);
  }
}

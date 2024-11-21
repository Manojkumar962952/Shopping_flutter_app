import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}

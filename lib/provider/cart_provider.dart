import 'package:flutter/material.dart';
import 'package:provider_task/model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;
  int get cartItemCount => _cartItems.length;

  void addToCart(CartItem item) {
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.title == item.title,
    );
    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex].quantity += 1;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
    void increment(CartItem item) {
    item.quantity += 1;
    notifyListeners();
  }
  void decrement(CartItem item) {
    if (item.quantity > 1) {
      item.quantity -= 1;
      notifyListeners();
    }
  }
  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

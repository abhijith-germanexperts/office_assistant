import 'package:flutter/material.dart';

import '../models/cartmodel.dart';
import 'package:ge_assistant/models/endusermenumodel.dart';

import '../models/inventorylistmodel.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Response item) {
    final cartItem = _cartItems.firstWhere(
      (items) => items.item.itemname == item.itemname,
      orElse: () => CartItem(item: item),
    );

    if (_cartItems.contains(cartItem)) {
      cartItem.quantity++;
    } else {
     // print("added");
      _cartItems.add(cartItem);
    }

    notifyListeners();
  }

  void removeFromCart(Response item) {
    final cartItem = _cartItems.firstWhere(
      (items) => items.item.itemname == item.itemname,
    );

    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      _cartItems.remove(cartItem);
    }

    notifyListeners();
  }

  void increaseQuantity(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      _cartItems.remove(cartItem);
    }
    notifyListeners();
  }

  void removeitem(Response item) {
    final cartItem = _cartItems.firstWhere(
      (items) => items.item.itemname == item.itemname,
    );
    _cartItems.remove(cartItem);
    notifyListeners();
  }
}

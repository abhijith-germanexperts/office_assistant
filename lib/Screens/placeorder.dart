import 'package:flutter/material.dart';
import 'package:ge_assistant/provider/service_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];

          return ListTile(
            title: Text(cartItem.item.itemname ?? ""),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
          );
        },
      ),
    );
  }
}

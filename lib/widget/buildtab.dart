import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/service_provider.dart';

Widget _buildTab(String label, BuildContext context, String apiUrl) {
  final cartProvider = Provider.of<CartProvider>(context);
  // final itemCount = cartProvider.cartItems
  //     .where((cartItem) => cartItem.item.itemname.contains(label))
  //     .length;

  return Tab(
    child: Column(
      children: [
        Expanded(child: Text(label)),
      ],
    ),
  );
}

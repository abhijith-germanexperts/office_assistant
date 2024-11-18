import 'package:ge_assistant/models/endusermenumodel.dart';
import 'package:ge_assistant/models/inventorylistmodel.dart';

class CartItem {
  final Response item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}

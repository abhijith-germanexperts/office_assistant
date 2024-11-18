import 'package:flutter/material.dart';
import 'package:ge_assistant/Screens/PantryUser/PantryUser_Completed_Order/Desktop_CompletedOrder.dart';
import 'package:ge_assistant/Screens/PantryUser/PantryUser_Completed_Order/Mobile_CompltedOrder.dart';
import 'package:ge_assistant/Screens/PantryUser/PantryUser_Completed_Order/responsiveLayout_CompletedOrder.dart';
class BasePantryCompletedOrder extends StatelessWidget {
  const BasePantryCompletedOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: ResponsiveLayoutPantryCompletedOrder(pantryCompletedOrderMobileBody: const MobilePantryCompletedOrder(), pantryCompletedOrderDesktopBody: DesktopPantryCompletedOrder()),
    );
  }
}
